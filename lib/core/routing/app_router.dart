import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/features/logion/ui/login_view.dart';
import 'package:fruit_hub/features/onBoarding/ui/onboarding_view.dart';
import 'package:fruit_hub/features/spalsh/ui/splash_view.dart';

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return null;
    }
  }
}
