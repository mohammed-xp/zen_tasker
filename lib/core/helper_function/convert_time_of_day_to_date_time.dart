import 'package:flutter/material.dart';

DateTime convertTimeOfDayToDateTime({required TimeOfDay time}) {
  DateTime now = DateTime.now();

// convert TimeOfDay to DateTime
  DateTime dateTime = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  return dateTime;
}
