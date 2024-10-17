import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile(context) ? 0 : 16),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Stack(
            children: [
              Center(
                child: CustomTitleText(fontSize: isMobile(context) ? 34 : 43),
              ),
              currentPage == OnboardingModel.onBoardingList(context).length - 1
                  ? const SizedBox()
                  : TextButton(
                      onPressed: () {
                        start();
                      },
                      child: Text(
                        S.of(context).skip,
                        style: isMobile(context)
                            ? AppStyles.styleSemiBold13(context).copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                              )
                            : AppStyles.styleSemiBold20(context).copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                      ),
                    ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 10,
            child: OnboardingPageView(
              pageViewController: pageController,
              onboardingList: OnboardingModel.onBoardingList(context),
            ),
          ),
          Expanded(
            flex: 4,
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
                      child: isMobile(context)
                          ? IconButton(
                              onPressed: () {
                                pageController.previousPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                              },
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
                              color: AppColors.primaryColor,
                            )
                          : ElevatedButton(
                              onPressed: () {
                                pageController.previousPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: AppColors.secendaryColor,
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                            )),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: OnboardingModel.onBoardingList(context).length,
                    effect: WormEffect(
                      dotHeight: isMobile(context) ? 13 : 23,
                      dotWidth: isMobile(context) ? 13 : 23,
                      activeDotColor: AppColors.primaryColor,
                      dotColor: Colors.grey,
                    ),
                  ),
                  TextButton(
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
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        isMobile(context)
                            ? Colors.white
                            : AppColors.primaryColor,
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        isMobile(context)
                            ? Colors.white
                            : AppColors.secendaryColor,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(isMobile(context) ? 0 : 10.0),
                      child: Text(
                        currentPage ==
                                OnboardingModel.onBoardingList(context).length -
                                    1
                            ? S.of(context).start
                            : S.of(context).next,
                        style: AppStyles.styleBold16(context).copyWith(
                          color: isMobile(context)
                              ? AppColors.primaryColor
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void start() {
    Prefs.setBool(kIsOnBoardingViewSeen, true);
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }
}
