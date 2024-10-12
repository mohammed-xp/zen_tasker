import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_images.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';

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
        Text.rich(
          TextSpan(
            text: 'Zen',
            style: AppStyles.styleBold35(context).copyWith(
              color: AppColors.secendaryColor,
            ),
            children: [
              TextSpan(
                text: 'Tasker',
                style: AppStyles.styleBold35(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
