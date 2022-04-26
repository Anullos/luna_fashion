import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/models/user_model.dart';
import '../../user/application/user_controller.dart';
import '../domain/auth_repository_interface.dart';

part 'auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._repository, this._userController)
      : super(const AuthState.none()) {
    _repository.authStates.listen(initUser);
  }
  final AuthRepositoryInterface _repository;
  final UserController _userController;

  Future<void> signOut() async {
    await _repository.signOut();
  }

  Future<void> initUser(User? user) async {
    if (user != null) {
      debugPrint(user.uid);
      final userModel = await _repository.getUserById(user.uid);
      if (userModel != null) {
        _userController.loadUser();
        state = AuthState.authenticated(userModel);
      } else {
        state = const AuthState.unauthenticated();
      }
    } else {
      state = const AuthState.unauthenticated();
    }
  }
}
