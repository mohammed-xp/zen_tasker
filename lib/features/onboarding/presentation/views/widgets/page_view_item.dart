import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen_tasker/core/models/onboarding_model.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.onboardingModel});

  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset(
              onboardingModel.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        onboardingModel.title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            onboardingModel.subtitle,
            style: AppStyles.styleRegular18(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
