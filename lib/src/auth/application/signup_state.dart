part of 'signup_controller.dart';

class SignUpState {
  const SignUpState({
    required this.fullname,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.showErrors,
    required this.signUpResult,
  });

  factory SignUpState.initial() => SignUpState(
        fullname: FullnameVos(''),
        email: EmailVos(''),
        password: PasswordVos(''),
        confirmPassword: RepeatPasswordVos(
          password: '',
          passToMatchWith: '',
        ),
        showErrors: false,
        signUpResult: ResultOr.none(),
      );

  final FullnameVos fullname;
  final EmailVos email;
  final PasswordVos password;
  final RepeatPasswordVos confirmPassword;
  final bool showErrors;
  final ResultOr<SignUpFailure> signUpResult;

  @override
  int get hashCode {
    return fullname.hashCode ^
        email.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode ^
        showErrors.hashCode ^
        signUpResult.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpState &&
        other.fullname == fullname &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.showErrors == showErrors &&
        other.signUpResult == signUpResult;
  }

  SignUpState copyWith({
    FullnameVos? fullname,
    EmailVos? email,
    PasswordVos? password,
    RepeatPasswordVos? confirmPassword,
    bool? showErrors,
    ResultOr<SignUpFailure>? signUpResult,
  }) {
    return SignUpState(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      showErrors: showErrors ?? this.showErrors,
      signUpResult: signUpResult ?? this.signUpResult,
    );
  }

  @override
  String toString() {
    return '''SignUpState( email: $email, password: $password, confirmPassword: $confirmPassword, showErrors: $showErrors, signUpResult: $signUpResult)''';
  }
}
