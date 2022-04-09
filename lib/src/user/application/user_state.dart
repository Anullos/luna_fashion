part of 'user_controller.dart';

class UserState {
  const UserState({
    required this.user,
    required this.counterNotifications,
  });
  final UserModel? user;
  final int counterNotifications;

  factory UserState.init() => const UserState(
        user: null,
        counterNotifications: 0,
      );

  UserState copyWith({
    UserModel? user,
    int? counterNotifications,
  }) =>
      UserState(
        user: user ?? this.user,
        counterNotifications: counterNotifications ?? this.counterNotifications,
      );
}
