import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Zen',
        style: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: fontSize),
          fontWeight: FontWeight.w700,
          color: AppColors.secendaryColor,
        ),
        children: [
          TextSpan(
            text: 'Tasker',
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: fontSize),
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
