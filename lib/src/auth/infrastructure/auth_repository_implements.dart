import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/infrastructure/collections.dart';
import '../../shared/infrastructure/dto/user_dto.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../domain/auth_repository_interface.dart';
import '../domain/failures/signup_failure.dart';
import '../domain/failures/signin_failure.dart';

class AuthRepositoryImplements extends AuthRepositoryInterface {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRepositoryImplements(this._firebaseAuth, this._firebaseFirestore);

  @override
  Stream<User?> get authStates => _firebaseAuth.authStateChanges();

  @override
  Future<ResultOr<SignInFailure>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return ResultOr.success();
    } on FirebaseAuthException catch (e, _) {
      if (e.code == 'wrong-password' ||
          e.code == 'user-not-found' ||
          e.code == 'invalid-email') {
        return ResultOr.failure(NonExistentUserAndPassword());
      } else {
        return ResultOr.failure(ServerError());
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<ResultOr<SignUpFailure>> signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUserById(String userId) async {
    final data =
        await _firebaseFirestore.collection(userCollection).doc(userId).get();

    if (data.exists) {
      final user = UserDto.fromMap(data.data()!).toDomain();
      return user;
    } else {
      return null;
    }
  }
}
