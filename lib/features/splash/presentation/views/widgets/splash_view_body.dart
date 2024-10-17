import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
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
          width: isMobile(context) ? 200 : 350,
          height: isMobile(context) ? 200 : 350,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 24,
        ),
        CustomTitleText(
          fontSize: isMobile(context) ? 35 : 50,
        ),
      ],
    );
  }
}
