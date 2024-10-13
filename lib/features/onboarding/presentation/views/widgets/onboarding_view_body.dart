import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/models/onboarding_model.dart';
import 'package:zen_tasker/core/services/prefs.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/core/widgets/custom_title_text.dart';
import 'package:zen_tasker/features/home/presentation/views/home_view.dart';
import 'package:zen_tasker/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:zen_tasker/generated/l10n.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Stack(
          children: [
            const Center(
              child: CustomTitleText(fontSize: 34),
            ),
            currentPage == OnboardingModel.onBoardingList(context).length - 1
                ? const SizedBox()
                : TextButton(
                    onPressed: () {
                      start();
                    },
                    child: Text(
                      S.of(context).skip,
                      style: AppStyles.styleSemiBold13(context).copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
          ],
        ),
        const SizedBox(
          height: 56,
        ),
        Expanded(
          flex: 2,
          child: OnboardingPageView(
            pageViewController: pageController,
            onboardingList: OnboardingModel.onBoardingList(context),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: currentPage != 0,
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: IconButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: AppColors.primaryColor,
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: OnboardingModel.onBoardingList(context).length,
                  effect: const WormEffect(
                    dotHeight: 13,
                    dotWidth: 13,
                    activeDotColor: AppColors.primaryColor,
                    dotColor: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (pageController.page ==
                        OnboardingModel.onBoardingList(context).length - 1) {
                      start();
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  icon: Text(
                    S.of(context).next,
                    style: AppStyles.styleBold16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void start() {
    Prefs.setBool(kIsOnBoardingViewSeen, true);
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }
}
