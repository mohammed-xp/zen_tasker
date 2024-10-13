import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_images.dart';
import 'package:zen_tasker/core/widgets/custom_title_text.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppImages.imagesLogoApp,
          width: 150,
          height: 150,
        ),
        const SizedBox(
          height: 24,
        ),
        const CustomTitleText(
          fontSize: 35,
        ),
      ],
    );
  }
}
