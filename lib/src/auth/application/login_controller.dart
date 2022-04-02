import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/presentation/utils/result_or.dart';
import '../domain/failures/signin_failure.dart';
import '../domain/auth_repository_interface.dart';
import '../domain/vos/email_vos.dart';
import '../domain/vos/password_vos.dart';

part 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._repository) : super(LoginState.initial());

  final AuthRepositoryInterface _repository;

  Future<void> signIn() async {
    if (state.email.isValid() && state.password.isValid()) {
      state = state.copyWith(signInFailureOrSuccess: ResultOr.loading());
      final result = await _repository.signInWithEmailAndPassword(
        email: state.email.getOrCrash(),
        password: state.password.getOrCrash(),
      );
      state = state.copyWith(signInFailureOrSuccess: result, showErrors: true);
      state = state.copyWith(signInFailureOrSuccess: ResultOr.none());
    } else {
      state = state.copyWith(showErrors: true);
    }
  }

  void passwordChanged(String pass) {
    state = state.copyWith(
      password: PasswordVos(pass),
    );
  }

  void emailChanged(String email) {
    state = state.copyWith(
      email: EmailVos(email),
    );
  }
}
