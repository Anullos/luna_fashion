import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/infrastructure/collections.dart';
import '../../shared/infrastructure/dto/user_dto.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/domain/types/user_role_type.dart';
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
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firebaseFirestore
          .collection(userCollection)
          .doc(userCredential.user!.uid)
          .set({
        'id': userCredential.user!.uid,
        'fullName': fullName,
        'email': email,
        'profilePictureUrl': '',
        'role': UserRoleType.user().toString(),
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'isOnBoardingCompleted': false,
        'currentCart': [],
      });

      return ResultOr.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ResultOr.failure(SignUpFailure.weakPassword());
      } else if (e.code == 'email-already-in-use') {
        return ResultOr.failure(SignUpFailure.emailAlreadyInUser());
      }
    } catch (e) {
      return ResultOr.failure(SignUpFailure.operationNotAllowed());
    }
    return ResultOr.success();
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

  @override
  Future<ResultOr<FirebaseFailure>> sendOnBoarding() async {
    try {
      await _firebaseFirestore
          .collection(userCollection)
          .doc(_firebaseAuth.currentUser!.uid)
          .update({
        'isOnBoardingCompleted': true,
      });
      return ResultOr.success();
    } catch (e) {
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }
}
