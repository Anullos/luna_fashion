import 'package:flutter/material.dart';

import '../utils/luna_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.backgroundGradient,
    this.isLoading = false,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final LinearGradient? backgroundGradient;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                gradient:
                    backgroundGradient ?? LunaColors.backgroundAuthGradient,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
