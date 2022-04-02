import 'package:flutter/material.dart';

import 'src/auth/presentation/pages/signup_page.dart';
import 'src/auth/presentation/pages/login_page.dart';
import 'src/home/presentation/pages/home_page.dart';
import 'src/shared/presentation/pages/splash_page.dart';

// zone splash
const String splashRoute = '/';
// zone auth
const String loginRoute = '/login';
const String signupRoute = '/signup';
const String recoverPasswordRoute = '/recover-password';
// zone home
const String homeRoute = '/home';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // splash
      case splashRoute:
        return MaterialPageRoute<void>(
          builder: (context) => const SplashPage(),
        );
      // auth
      case loginRoute:
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(
                opacity: animation1, child: const LoginPage());
          },
        );
      case signupRoute:
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(
                opacity: animation1, child: const SignUpPage());
          },
        );
      // home
      case homeRoute:
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(opacity: animation1, child: const HomePage());
          },
        );
      // default
      default:
        return MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
