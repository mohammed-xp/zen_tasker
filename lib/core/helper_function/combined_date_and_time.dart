/// Combine a date string and a time string into a single DateTime object.
///
/// The date string is expected to be in the format "yyyy-MM-dd".
/// The time string is expected to be in the format "HH:mm:ss".
///
/// Returns a DateTime object that represents the combined date and time.
DateTime combinedDateAndTime({required String date, required String time}) {
  DateTime parsedDate = DateTime.parse(date);

  // تحليل الوقت من String (والذي تم تحويله من DateTime سابقاً)
  List<String> timeComponents = time.split(' ')[1].split(':');
  int hour = int.parse(timeComponents[0]);
  int minute = int.parse(timeComponents[1]);
  int second = int.parse(timeComponents[2].split('.')[0]);

  // دمج التاريخ والوقت في كائن DateTime واحد
  DateTime combinedDateTime = DateTime(
    parsedDate.year,
    parsedDate.month,
    parsedDate.day,
    hour,
    minute,
    second,
  );

  return combinedDateTime;
}
