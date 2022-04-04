import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/models/user_model.dart';
import '../domain/user_repository_interface.dart';

part 'user_state.dart';

class UserController extends StateNotifier<UserState> {
  UserController(
    this._repository,
    this._user,
  ) : super(UserState.init());
  final UserRepositoryInterface _repository;
  final UserModel? _user;

  StreamSubscription? _profileSubcription;

  void changeUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  void changeUserId() {
    state = state.copyWith(userId: _user?.id);
  }

  void loadUser() async {
    _profileSubcription?.cancel();

    _profileSubcription = _repository.getUser().listen(changeUser);
  }

  @override
  void dispose() {
    _profileSubcription?.cancel();
    super.dispose();
  }
}
