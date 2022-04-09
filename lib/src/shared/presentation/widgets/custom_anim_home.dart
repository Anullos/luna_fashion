import 'package:flutter/material.dart';

import '../utils/luna_colors.dart';

class CustomAnimHome extends StatelessWidget {
  const CustomAnimHome({
    Key? key,
    required this.duration,
    required this.height,
    required this.radioValue,
    required this.durationIcon,
    required this.iconHeight,
    required this.iconWidth,
    required this.onTap,
    required this.text,
    required this.isCompleted,
  }) : super(key: key);
  final Duration duration;
  final Duration durationIcon;
  final double height;
  final double radioValue;
  final double iconHeight;
  final double iconWidth;
  final VoidCallback onTap;
  final String text;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: duration,
        height: height,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          gradient: height > 200
              ? LunaColors.backgroundAuthGradient
              : LunaColors.gradientButtonOnBoarding,
        ),
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: onTap,
                child: AnimatedOpacity(
                  duration: durationIcon,
                  opacity: height > 200 ? 1 : 0,
                  child: AnimatedContainer(
                    duration: durationIcon,
                    height: height < iconHeight ? height : iconHeight,
                    width: height < iconHeight ? height : iconWidth,
                    curve: Curves.fastOutSlowIn,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
