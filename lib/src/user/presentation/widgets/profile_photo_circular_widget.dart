import 'package:flutter/material.dart';

class ProfilePhotoCircularWidget extends StatelessWidget {
  const ProfilePhotoCircularWidget({Key? key, required this.profilePctureUrl})
      : super(key: key);
  final String? profilePctureUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 45),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Container(
        clipBehavior: Clip.hardEdge,
        constraints: const BoxConstraints(maxHeight: 45),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: profilePctureUrl != null && profilePctureUrl != ''
            ? Image.network(
                profilePctureUrl!,
                width: 45,
              )
            : Image.asset(
                'assets/images/profile_placeholder.png',
                width: 45,
              ),
      ),
    );
  }
}
