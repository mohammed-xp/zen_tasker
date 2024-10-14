import 'package:flutter/material.dart';
import 'package:zen_tasker/features/create_task/presentation/views/create_task_view.dart';
import 'package:zen_tasker/features/home/presentation/views/home_view.dart';
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

    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const HomeView(),
      );

    case CreateTaskView.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const CreateTaskView(),
      );

    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => const Scaffold(),
      );
  }
}
