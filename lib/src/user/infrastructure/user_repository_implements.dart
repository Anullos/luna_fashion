import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/domain/models/user_model.dart';
import '../../shared/infrastructure/dto/user_dto.dart';
import '../domain/user_repository_interface.dart';

class UserRepositoryImplements extends UserRepositoryInterface {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImplements(this._firestore, this._firebaseAuth);

  @override
  Stream<UserModel> getUser() async* {
    final userId = _firebaseAuth.currentUser?.uid;
    final snapthot = _firestore.collection('users').doc(userId).snapshots();

    yield* snapthot.map((doc) => UserDto.fromMap(doc.data()!).toDomain());
  }
}
