import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../admin/application/add_product_controller.dart';
import '../../admin/infrastructure/admin_repository_implements.dart';
import 'home_controller.dart';
import '../../user/infrastructure/user_repository_implements.dart';
import '../../auth/application/onboarding_controller.dart';
import '../../user/application/user_controller.dart';
import '../../auth/application/auth_controller.dart';
import '../../auth/application/login_controller.dart';
import '../../auth/application/signup_controller.dart';
import '../../auth/infrastructure/auth_repository_implements.dart';
import 'localization_controller.dart';

// Globals
final firebaseAuth = Provider((_) => FirebaseAuth.instance);

final firebaseStore = Provider((_) => FirebaseFirestore.instance);

final firebaseStorage = Provider((_) => FirebaseStorage.instance);

// Authtentication
final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImplements(
    ref.watch(firebaseAuth),
    ref.watch(firebaseStore),
  ),
);
final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(
    ref.watch(authRepositoryProvider),
    ref.read(userController.notifier),
  );
});

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>(
  (ref) {
    return LoginController(ref.watch(authRepositoryProvider));
  },
);

final signUpControllerProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SignUpController(authRepository);
  },
);

final onBoardingControllerProvider =
    StateNotifierProvider.autoDispose<OnBoardingController, OnBoardingState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return OnBoardingController(authRepository);
  },
);

// User
final userRepositoryProvider = Provider(
  (ref) => UserRepositoryImplements(
    ref.watch(firebaseStore),
    ref.watch(firebaseAuth),
  ),
);

final userController = StateNotifierProvider<UserController, UserState>(
  (ref) {
    final repository = ref.watch(userRepositoryProvider);
    return UserController(repository);
  },
);

// Home
final homeController =
    StateNotifierProvider.autoDispose<HomeController, HomeState>(
  (ref) {
    return HomeController();
  },
);

final localizationController =
    StateNotifierProvider<LocalizationController, LocalizationState>(
  (ref) {
    return LocalizationController();
  },
);

// Admin
final adminRepositoryProvider = Provider(
  (ref) => AdminRepositoryImplements(
    ref.watch(firebaseStore),
    ref.watch(firebaseStorage),
  ),
);

final addProductController =
    StateNotifierProvider.autoDispose<AddProductController, AddProductState>(
  (ref) {
    final repository = ref.watch(adminRepositoryProvider);
    return AddProductController(repository);
  },
);

final productsList = StreamProvider.autoDispose(
  (ref) async* {
    final repository = ref.watch(adminRepositoryProvider);
    final response = repository.getProducts();
    yield* response;
  },
);
