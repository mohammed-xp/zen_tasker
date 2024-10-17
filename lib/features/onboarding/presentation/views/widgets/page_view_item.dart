import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/models/onboarding_model.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.onboardingModel});

  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .4,
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                onboardingModel.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        onboardingModel.title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile(context) ? 8 : 40),
          child: Text(
            onboardingModel.subtitle,
            style: isMobile(context)
                ? AppStyles.styleRegular18(context)
                : AppStyles.styleRegular28(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
