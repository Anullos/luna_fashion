import 'package:flutter/material.dart';

import '../../../shared/presentation/utils/luna_colors.dart';

class CustomAnimScreen extends StatelessWidget {
  const CustomAnimScreen({
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
      alignment: Alignment.topCenter,
      child: AnimatedContainer(
        duration: duration,
        height: height,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          gradient: LunaColors.backgroundAuthGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radioValue),
            bottomRight: Radius.circular(radioValue),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: onTap,
                child: AnimatedContainer(
                  duration: durationIcon,
                  height: iconHeight,
                  width: iconWidth,
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
            FutureBuilder(
              future: Future.delayed(durationIcon),
              builder: (_, snapshot) => Positioned(
                bottom: 20,
                right: 24,
                left: 24,
                child: AnimatedOpacity(
                  opacity: isCompleted &&
                          snapshot.connectionState == ConnectionState.done
                      ? 1
                      : 0,
                  duration: durationIcon,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
