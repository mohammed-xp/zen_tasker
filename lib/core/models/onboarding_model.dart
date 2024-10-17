import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_images.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/generated/l10n.dart';

class OnboardingModel {
  final String image;
  final Widget title;
  final String subtitle;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  static List<OnboardingModel> onBoardingList(context) => [
        OnboardingModel(
          image: AppImages.imagesLogoAppSvg,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${S.of(context).welcomeTo} ',
                  style: isMobile(context)
                      ? AppStyles.styleThick24(context)
                      : AppStyles.styleThick34(context),
                ),
                TextSpan(
                  text: S.of(context).zen,
                  style: isMobile(context)
                      ? AppStyles.styleThick24(context).copyWith(
                          color: AppColors.secendaryColor,
                        )
                      : AppStyles.styleThick34(context).copyWith(
                          color: AppColors.secendaryColor,
                        ),
                ),
                TextSpan(
                  text: S.of(context).tasker,
                  style: isMobile(context)
                      ? AppStyles.styleThick24(context).copyWith(
                          color: AppColors.primaryColor,
                        )
                      : AppStyles.styleThick34(context).copyWith(
                          color: AppColors.primaryColor,
                        ),
                ),
              ],
            ),
          ),
          subtitle: S.of(context).onBoardingSubTitle1,
        ),
        OnboardingModel(
          image: AppImages.imagesOnboardingImage2,
          title: Text(
            S.of(context).onBoardingTitle2,
            style: AppStyles.styleBold23(context),
          ),
          subtitle: S.of(context).onBoardingSubTitle2,
        ),
        OnboardingModel(
          image: AppImages.imagesOnboardingImage3,
          title: Text(
            S.of(context).onBoardingTitle3,
            style: AppStyles.styleBold23(context),
          ),
          subtitle: S.of(context).onBoardingSubTitle3,
        ),
        OnboardingModel(
          image: AppImages.imagesOnboardingImage4,
          title: Text(
            S.of(context).onBoardingTitle4,
            style: AppStyles.styleBold23(context),
            textAlign: TextAlign.center,
          ),
          subtitle: S.of(context).onBoardingSubTitle4,
        ),
        OnboardingModel(
          image: AppImages.imagesOnboardingImage5,
          title: Text(
            S.of(context).onBoardingTitle5,
            style: AppStyles.styleBold23(context),
          ),
          subtitle: S.of(context).onBoardingSubTitle5,
        ),
      ];
}
