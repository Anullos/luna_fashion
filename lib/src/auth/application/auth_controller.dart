import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/models/user_model.dart';
import '../domain/auth_repository_interface.dart';

part 'auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._repository) : super(const AuthState.none()) {
    _repository.authStates.listen(initUser);
  }
  final AuthRepositoryInterface _repository;

  Future<void> signOut() async {
    await _repository.signOut();
  }

  Future<void> initUser(User? user) async {
    if (user != null) {
      final userModel = await _repository.getUserById(user.uid);

      if (userModel != null) {
        state = AuthState.authenticated(userModel);
      } else {
        state = const AuthState.unauthenticated();
      }
    } else {
      state = const AuthState.unauthenticated();
    }
  }
}