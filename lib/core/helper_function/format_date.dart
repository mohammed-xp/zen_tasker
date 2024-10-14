import 'package:intl/intl.dart';

String formatDate({required DateTime date}) {
  return DateFormat('dd MMM, yyyy').format(date);
}
