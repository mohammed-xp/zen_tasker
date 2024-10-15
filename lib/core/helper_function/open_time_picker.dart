import 'package:flutter/material.dart';

Future<TimeOfDay?> openTimePicker(BuildContext context,
    {DateTime? initialTime}) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initialTime ?? DateTime.now()),
    builder: (BuildContext context, Widget? child) => MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
      child: Localizations.override(
        context: context,
        // locale: const Locale('en', 'US'),
        child: child!,
      ),
    ),
  );
  return pickedTime;
}
