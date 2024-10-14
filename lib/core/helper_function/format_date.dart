import 'package:intl/intl.dart';

String formatDate({required DateTime date}) {
  return DateFormat('MMM dd, yyyy').format(date);
}
