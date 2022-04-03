import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/presentation/utils/value_object.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../../shared/presentation/utils/util_extensions.dart';
import '../domain/auth_repository_interface.dart';
import '../domain/failures/signup_failure.dart';
import '../domain/vos/email_vos.dart';
import '../domain/vos/fullname_vos.dart';
import '../domain/vos/password_vos.dart';
import '../domain/vos/repeat_password_vos.dart';

part 'signup_state.dart';

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController(this._repository) : super(SignUpState.initial());

  final AuthRepositoryInterface _repository;

  void fullnameChanged(String fullname) {
    state = state.copyWith(
      fullname: FullnameVos(fullname),
    );
  }

  void emailChanged(String email) {
    state = state.copyWith(
      email: EmailVos(email),
    );
  }

  void passwordChanged(String pass) {
    state = state.copyWith(
      password: PasswordVos(pass),
    );
  }

  void repeatPasswordChanged(String value) {
    if (state.password.isValid()) {
      state = state.copyWith(
        confirmPassword: RepeatPasswordVos(
          password: value,
          passToMatchWith: state.password.getOrCrash(),
        ),
      );
    }
  }

  Future<void> signUp() async {
    if (state.confirmPassword.value.right == '') {
      state = state.copyWith(
        confirmPassword: RepeatPasswordVos(
          password: '',
          passToMatchWith: 'state.password.getOrCrash()',
        ),
      );
      state = state.copyWith(showErrors: true);
      return;
    }
    if (_allFieldsAreValid()) {
      state = state.copyWith(signUpResult: ResultOr.loading());

      final result = await _repository.signUp(
        fullName: state.fullname.getOrCrash(),
        email: state.email.getOrCrash(),
        password: state.password.getOrCrash(),
      );
      state = state.copyWith(signUpResult: result, showErrors: true);
    } else {
      state = state.copyWith(showErrors: true);
    }
    state = state.copyWith(signUpResult: ResultOr.none());
  }

  bool _allFieldsAreValid() => <ValueObject>[
        state.fullname,
        state.email,
        state.password,
        state.confirmPassword,
      ].areValid;
}
