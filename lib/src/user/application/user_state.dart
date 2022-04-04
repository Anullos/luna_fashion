part of 'user_controller.dart';

class UserState {
  const UserState({
    required this.user,
    required this.userId,
    required this.counterNotifications,
  });
  final UserModel? user;
  final String? userId;
  final int counterNotifications;

  factory UserState.init() => const UserState(
        user: null,
        userId: null,
        counterNotifications: 0,
      );

  UserState copyWith({
    UserModel? user,
    String? userId,
    int? counterNotifications,
  }) =>
      UserState(
        user: user ?? this.user,
        userId: userId ?? this.userId,
        counterNotifications: counterNotifications ?? this.counterNotifications,
      );
}
