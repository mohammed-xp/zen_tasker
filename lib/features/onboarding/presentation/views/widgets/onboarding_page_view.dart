import 'package:flutter/material.dart';
import 'package:zen_tasker/core/models/onboarding_model.dart';
import 'package:zen_tasker/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageViewController,
    required this.onboardingList,
  });

  final PageController pageViewController;
  final List<OnboardingModel> onboardingList;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageViewController,
      itemBuilder: (context, index) {
        return PageViewItem(
          onboardingModel: onboardingList[index],
        );
      },
      // children: onboardingList.map((OnboardingModel onboardingModel) {
      //   return PageViewItem(
      //     onboardingModel: onboardingModel,
      //   );
      // }).toList(),
    );
  }
}
