part of 'login_controller.dart';

class LoginState {
  const LoginState({
    required this.email,
    required this.password,
    required this.showErrors,
    required this.signInFailureOrSuccess,
  });

  factory LoginState.initial() => LoginState(
        email: EmailVos(''),
        password: PasswordVos(''),
        showErrors: false,
        signInFailureOrSuccess: ResultOr.none(),
      );

  final EmailVos email;
  final PasswordVos password;
  final bool showErrors;
  final ResultOr<SignInFailure> signInFailureOrSuccess;

  LoginState copyWith({
    EmailVos? email,
    PasswordVos? password,
    bool? showErrors,
    ResultOr<SignInFailure>? signInFailureOrSuccess,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      showErrors: showErrors ?? this.showErrors,
      signInFailureOrSuccess:
          signInFailureOrSuccess ?? this.signInFailureOrSuccess,
    );
  }

  @override
  String toString() {
    return '''LoginState(email: $email, password: $password, showErrors: $showErrors, signInFailureOrSuccess: $signInFailureOrSuccess)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.email == email &&
        other.password == password &&
        other.showErrors == showErrors &&
        other.signInFailureOrSuccess == signInFailureOrSuccess;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        showErrors.hashCode ^
        signInFailureOrSuccess.hashCode;
  }
}
