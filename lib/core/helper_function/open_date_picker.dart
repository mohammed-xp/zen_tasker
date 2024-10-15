import 'package:flutter/material.dart';

Future<DateTime?> openDatePicker(BuildContext context,
    {DateTime? initialDate}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );
  return picked;
}
