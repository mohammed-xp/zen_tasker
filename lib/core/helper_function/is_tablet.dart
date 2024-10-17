import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/size_config.dart';

bool isMobile(context) {
  return MediaQuery.sizeOf(context).width < SizeConfig.tablet;
}
