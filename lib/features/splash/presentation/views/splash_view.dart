import 'package:flutter/material.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/services/prefs.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/features/home/presentation/views/home_view.dart';
import 'package:zen_tasker/features/onboarding/presentation/views/onboarding_view.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routeName = 'splashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Color _backgroundColor = AppColors.primaryColor;

  @override
  void initState() {
    excuteNavigation();
    _changeColor();

    super.initState();
  }

  /// Changes the background color of the SplashView over time. It starts with
  /// [AppColors.primaryColor], then changes to [AppColors.secendaryColor] after
  /// 1 second, and finally changes to [Colors.white] after 2 seconds. This
  /// creates a simple animation effect.
  void _changeColor() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _backgroundColor = AppColors.secendaryColor;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _backgroundColor = Colors.white;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: _backgroundColor,
        duration: const Duration(seconds: 1),
        child: const SplashViewBody(),
      ),
    );
  }

  /// Navigates to either the [HomeView] or the [OnboardingView] after a delay of
  /// 5 seconds. If [kIsOnBoardingViewSeen] is true, it navigates to the
  /// [HomeView], otherwise it navigates to the [OnboardingView].
  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 5), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
  }
}
