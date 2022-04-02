import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/domain/models/user_model.dart';
import '../../shared/presentation/utils/result_or.dart';
import 'failures/signup_failure.dart';
import 'failures/signin_failure.dart';

abstract class AuthRepositoryInterface {
  Future<ResultOr<SignInFailure>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();

  Future<ResultOr<SignUpFailure>> signUp({
    required String fullName,
    required String email,
    required String password,
  });

  Stream<User?> get authStates;

  Future<UserModel?> getUserById(String userId);

  // Future<ResultOr<OnBoardingFailure>> sendOnBoarding(RequestOnBoarding request);
}
