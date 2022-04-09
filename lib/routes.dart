import 'package:flutter/material.dart';

import 'src/admin/presentation/pages/add_product.dart';
import 'src/auth/presentation/pages/onboarding_page.dart';
import 'src/auth/presentation/pages/signup_page.dart';
import 'src/auth/presentation/pages/login_page.dart';
import 'src/shared/presentation/pages/home_page.dart';
import 'src/shared/presentation/pages/splash_page.dart';

// zone splash
const String splashRoute = '/';
// zone auth
const String loginRoute = '/login';
const String signupRoute = '/signup';
const String recoverPasswordRoute = '/recover-password';
const String onBoardingRoute = '/onboarding';
// zone home
const String homeRoute = '/home';
// zone user
const String editProfileRoute = '/edit-profile';
const String changePasswordRoute = '/change-password';
const String addProductRoute = '/add-product';
const String seeOrdersRoute = '/see-orders';

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
      case onBoardingRoute:
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(
                opacity: animation1, child: const OnBoardingPage());
          },
        );
      // home
      case homeRoute:
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(opacity: animation1, child: const HomePage());
          },
        );
      case addProductRoute:
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(
                opacity: animation1, child: const AddProduct());
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
