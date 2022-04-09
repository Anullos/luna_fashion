import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/models/user_model.dart';
import '../domain/user_repository_interface.dart';

part 'user_state.dart';

class UserController extends StateNotifier<UserState> {
  UserController(
    this._repository,
  ) : super(UserState.init());
  final UserRepositoryInterface _repository;

  StreamSubscription? _userSubcription;

  void changeUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  void loadUser() async {
    _userSubcription?.cancel();
    _userSubcription = _repository.getUser().listen(changeUser);
  }

  @override
  void dispose() {
    _userSubcription?.cancel();
    super.dispose();
  }
}
