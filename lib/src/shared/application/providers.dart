import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/application/auth_controller.dart';
import '../../auth/application/login_controller.dart';
import '../../auth/application/signup_controller.dart';
import '../../auth/infrastructure/auth_repository_implements.dart';

// Globals
final firebaseAuth = Provider((_) => FirebaseAuth.instance);

final firebaseStore = Provider((_) => FirebaseFirestore.instance);

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



// User
// final userRepositoryProvider = Provider(
//   (ref) => UserRepositoryImplements(
//     ref.watch(firebaseStore),
//     ref.watch(firebaseAuth),
//   ),
// );

// final userController = StateNotifierProvider<UserController, UserState>(
//   (ref) {
//     final repository = ref.watch(userRepositoryProvider);
//     final user = ref.watch(authControllerProvider).user;
//     return UserController(repository, user);
//   },
// );

// Home
// final homeRepositoryProvider = Provider(
//   (ref) => HomeRepositoryImplements(
//     ref.watch(firebaseStore),
//     ref.watch(dioInstanceUser),
//   ),
// );

// final homeController =
//     StateNotifierProvider.autoDispose<HomeController, HomeState>(
//   (ref) {
//     final repository = ref.watch(homeRepositoryProvider);
//     return HomeController(repository);
//   },
// );


