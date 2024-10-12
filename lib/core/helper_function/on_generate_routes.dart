import 'package:flutter/material.dart';
import 'package:zen_tasker/features/onboarding/presentation/views/onboarding_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const SplashView(),
      );

    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const OnboardingView(),
      );

    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => const Scaffold(),
      );
  }
}
