import 'package:flutter/material.dart';

String formatTime({required TimeOfDay time}) {
  String period = time.period == DayPeriod.am ? "AM" : "PM";

  int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;

  String formattedTime =
      "$hour:${time.minute.toString().padLeft(2, '0')} $period";

  return formattedTime;
}
