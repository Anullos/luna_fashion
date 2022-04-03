import 'package:flutter/material.dart';

import '../../../shared/presentation/utils/luna_colors.dart';

class CustomAnimOnBoarding extends StatelessWidget {
  const CustomAnimOnBoarding({
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
        width: height,
        margin: EdgeInsets.only(
          bottom:
              height > 200 ? 0 : MediaQuery.of(context).size.height * 0.2 - 80,
        ),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          gradient: height > 200
              ? LunaColors.backgroundAuthGradient
              : LunaColors.gradientButtonOnBoarding,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radioValue),
            topRight: Radius.circular(radioValue),
            bottomLeft: Radius.circular(radioValue),
            bottomRight: Radius.circular(radioValue),
          ),
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
                    duration: duration,
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
