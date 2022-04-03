import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes.dart';
import '../../../auth/application/auth_controller.dart';
import '../../application/providers.dart';
import '../utils/luna_colors.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref
          .read(authControllerProvider.notifier)
          .initUser(FirebaseAuth.instance.currentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthStatus>(
      authControllerProvider.select((value) => value.status),
      (previous, next) {
        if (previous != next) {
          debugPrint('SplashPage verifing...');
          if (next == AuthStatus.authenticated) {
            final user = ref.read(authControllerProvider).user;
            // ref.read(authControllerProvider.notifier).signOut();
            if (user!.isOnBoardingCompleted) {
              Navigator.pushReplacementNamed(context, homeRoute);
            } else {
              Navigator.pushNamed(context, onBoardingRoute);
            }
          } else {
            Navigator.pushReplacementNamed(context, loginRoute);
          }
        }
      },
    );

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
