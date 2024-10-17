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

  static TextStyle styleBold40(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 35),
        fontWeight: FontWeight.w700,
        color: const Color(0xff363942),
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

  static TextStyle styleMedium28(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle styleMedium24(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w500,
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

/// Returns a font size that is responsive to the device's screen size.
///
/// The font size is scaled based on the width of the device's screen. The
/// scaling factor is determined by the [_getScaleFactor] function, which
/// returns a value between 0 and 1. The font size is then multiplied by
/// this scaling factor.
///
/// The resulting font size is clamped to a range of 80% to 120% of the
/// original font size, to prevent the font from becoming too large or
/// too small.
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = _getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

/// Calculates a scale factor based on the width of the device's screen.
///
/// The scale factor is a value between 0 and 1 that is used to scale font
/// sizes. The scale factor is determined by the width of the screen, such
/// that the font size is larger on larger screens and smaller on smaller
/// screens.
///
/// The scale factor is calculated as follows:
///
/// - If the width is less than [SizeConfig.tablet], the scale factor is
///   the width divided by [SizeConfig.mobile].
/// - If the width is less than [SizeConfig.desktop], the scale factor is
///   the width divided by [SizeConfig.tablet].
/// - Otherwise, the scale factor is the width divided by [SizeConfig.tablet].
///
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
