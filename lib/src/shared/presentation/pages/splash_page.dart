import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../utils/luna_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LunaColors.backgroundAuthGradient,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, loginRoute);
          },
          child: Center(
            child: Container(
              height: 200,
              width: 200,
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
    );
  }
}
