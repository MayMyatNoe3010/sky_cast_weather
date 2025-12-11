import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

extension DateExtension on DateTime{
  int getDateDifference(DateTime date) {
    return DateTime(this.year, this.month, this.day)
        .difference(DateTime(date.year, date.month, date.day))
        .inDays;
  }
  String getWithoutTimeString(){
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }

  List<DateTime> getWeekDates() {
    List<DateTime> dateTimeList = [];

    // Start from Sunday
    DateTime sunday = this.subtract(Duration(days: this.weekday % 7));

    for (int i = 0; i < 7; i++) {
      dateTimeList.add(sunday.add(Duration(days: i)));
    }

    return dateTimeList;
  }
  tz.TZDateTime getTZTime(int minBefore){

    final tzDateTime = tz.TZDateTime.from(this, tz.local);
    return tzDateTime.subtract(Duration(seconds: 10));//minutes: minBefore));

  }

}