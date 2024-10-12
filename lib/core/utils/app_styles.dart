import 'package:flutter/material.dart';

import 'size_config.dart';

abstract class AppStyles {
  static TextStyle styleMedium14(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
        color: const Color(0xff363942),
      );

  static TextStyle styleMedium16(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
        color: const Color(0xff363942),
      );

  static TextStyle styleRegular12(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w400,
        color: const Color(0xff363942),
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
