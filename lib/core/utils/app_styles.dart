import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';

import 'size_config.dart';

abstract class AppStyles {
  static TextStyle styleThick34(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 34),
        fontWeight: FontWeight.w900,
        color: const Color(0xff363942),
      );

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

  static TextStyle styleBold18(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle styleBold16(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle styleBold13(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle styleSemiBold24(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle styleSemiBold20(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle styleSemiBold13(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle styleMedium20(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle styleMedium16(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle styleMedium12(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(.50),
      );

  static TextStyle styleRegular28(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle styleRegular18(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle styleRegular15(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      );

  static TextStyle styleRegular13(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      );
}

/// Calculates the responsive font size based on the provided [fontSize] and the scaling factor
/// determined by the [BuildContext]. It ensures the font size stays within a range of 80% to 120%
/// of the original size to maintain readability and consistency across different screen sizes.
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = _getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

/// Determines the scaling factor based on the width of the device's screen.
///
/// The scale factor is calculated by dividing the screen width by a fixed
/// base value, which varies depending on the device type:
/// - For devices smaller than a tablet, the base value is 400.
/// - For devices smaller than a desktop, the base value is 800.
/// - For desktop-sized devices, the base value is 1200.
///
/// This factor is used to adjust UI elements for different screen sizes.
double _getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < SizeConfig.tablet) {
    return width / SizeConfig.mobile;
  } else if (width < SizeConfig.desktop) {
    return width / SizeConfig.tablet;
  } else {
    return width / SizeConfig.tablet;
  }
}
