import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';

import 'size_config.dart';

abstract class AppStyles {
  static TextStyle styleThick24(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w900,
        color: const Color(0xff363942),
      );

  static TextStyle styleThick15(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        fontWeight: FontWeight.w900,
        color: AppColors.primaryColor,
      );

  static TextStyle styleBold35(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 35),
        fontWeight: FontWeight.w700,
        color: const Color(0xff363942),
      );

  static TextStyle styleBold23(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 23),
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle styleBold16(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle styleSemiBold13(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle styleRegular18(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle styleRegular13(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      );
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = _getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double _getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < SizeConfig.tablet) {
    return width / 400;
  } else if (width < SizeConfig.desktop) {
    return width / 800;
  } else {
    return width / 1200;
  }
}
