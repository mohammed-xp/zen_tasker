import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/generated/l10n.dart';

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
        text: S.of(context).zen,
        style: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: fontSize),
          fontWeight: FontWeight.w700,
          color: AppColors.secendaryColor,
        ),
        children: [
          TextSpan(
            text: S.of(context).tasker,
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
