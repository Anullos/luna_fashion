import 'dart:convert';

import '../../domain/models/user_model.dart';
import '../../domain/types/user_role_type.dart';

class UserDto {
  final String id;
  final String fullName;
  final String email;
  final String profilePictureUrl;
  final UserRoleType role;
  final int createdAt;
  final bool isOnBoardingCompleted;
  UserDto({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profilePictureUrl,
    required this.role,
    required this.createdAt,
    required this.isOnBoardingCompleted,
  });
  UserDto._({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profilePictureUrl,
    required this.role,
    required this.createdAt,
    required this.isOnBoardingCompleted,
  });

  static UserDto fromDomain(UserModel domain) {
    return UserDto._(
      id: domain.id,
      fullName: domain.fullName,
      email: domain.email,
      profilePictureUrl: domain.profilePictureUrl,
      role: domain.role,
      createdAt: domain.createdAt,
      isOnBoardingCompleted: domain.isOnBoardingCompleted,
    );
  }

  UserModel toDomain() {
    return UserModel(
      id: id,
      fullName: fullName,
      email: email,
      profilePictureUrl: profilePictureUrl,
      role: role,
      createdAt: createdAt,
      isOnBoardingCompleted: isOnBoardingCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'role': role.toString(),
      'createdAt': createdAt,
      'isOnBoardingCompleted': isOnBoardingCompleted,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
      role: UserRoleType.fromString(map['role']),
      createdAt: map['createdAt']?.toInt() ?? 0,
      isOnBoardingCompleted: map['isOnBoardingCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source));
}
