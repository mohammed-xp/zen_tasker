import 'package:intl/intl.dart';

String formatTime({required DateTime dateTime}) {
  String formattedTime = DateFormat('hh:mm a').format(dateTime);

  return formattedTime;
}
