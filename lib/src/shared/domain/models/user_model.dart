import '../../../order/domain/models/product_order_model.dart';
import '../types/user_role_type.dart';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String profilePictureUrl;
  final UserRoleType role;
  final int createdAt;
  final bool isOnBoardingCompleted;
  final List<ProductOrderModel> currentCart;
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profilePictureUrl,
    required this.role,
    required this.createdAt,
    required this.isOnBoardingCompleted,
    required this.currentCart,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? profilePictureUrl,
    UserRoleType? role,
    int? createdAt,
    bool? isOnBoardingCompleted,
    List<ProductOrderModel>? currentCart,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      isOnBoardingCompleted:
          isOnBoardingCompleted ?? this.isOnBoardingCompleted,
      currentCart: currentCart ?? this.currentCart,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, profilePictureUrl: $profilePictureUrl, role: $role, createdAt: $createdAt, isOnBoardingCompleted: $isOnBoardingCompleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.fullName == fullName &&
        other.email == email &&
        other.profilePictureUrl == profilePictureUrl &&
        other.role == role &&
        other.createdAt == createdAt &&
        other.isOnBoardingCompleted == isOnBoardingCompleted &&
        other.currentCart == currentCart;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        profilePictureUrl.hashCode ^
        role.hashCode ^
        createdAt.hashCode ^
        isOnBoardingCompleted.hashCode ^
        currentCart.hashCode;
  }
}
