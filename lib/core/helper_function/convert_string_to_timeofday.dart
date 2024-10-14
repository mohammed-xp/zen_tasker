import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TimeOfDay convertStringToTimeOfDay(String timeString) {
  DateFormat dateFormat = DateFormat.jm(); // 'jm' للتنسيق بنمط 12 ساعة مع AM/PM
  DateTime dateTime = dateFormat.parse(timeString);

// استخراج الساعات والدقائق وإنشاء كائن TimeOfDay
  return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
}
