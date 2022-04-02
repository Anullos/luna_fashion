part of 'auth_controller.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  none,
}

class AuthState {
  const AuthState({
    required this.status,
    this.user,
  });
  const AuthState._({
    required this.status,
    this.user,
  });
  final AuthStatus status;
  final UserModel? user;

  AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
  }) =>
      AuthState(
        status: status ?? this.status,
        user: user ?? this.user,
      );

  const AuthState.authenticated(UserModel user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.none() : this._(status: AuthStatus.none);
}
