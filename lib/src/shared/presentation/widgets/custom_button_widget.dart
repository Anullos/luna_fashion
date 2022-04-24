import 'package:flutter/material.dart';

import '../utils/luna_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.background,
    this.isLoading = false,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String text;
  final Color? background;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              primary: background ?? LunaColors.orangeLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
