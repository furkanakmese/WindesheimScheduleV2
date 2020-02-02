import 'package:date_format/date_format.dart';

List getLessons(List allLessons, String date) {
  List newLessons = [];
  for (var lesson in allLessons) {
    if (lesson['roosterdatum'] == date) {
      newLessons.add(lesson);
    }
  }
  return newLessons;
}

DateTime getCorrectDate(DateTime date, int day) {
  while (date.weekday != day) {
    if(date.weekday < day) {
      date = date.add(new Duration(days: 1));
    } else {
      date = date.subtract(new Duration(days: 1));
    }
  }
  return date;
}

List getDayLessons(List allLessons, int day, DateTime date) {
  List newLessons = [];
  String formattedDate = formatDate(getCorrectDate(date, day), [yyyy, '-', mm, '-', dd, 'T00:00:00Z']);

  for (var lesson in allLessons) {
    if (DateTime.parse(lesson['roosterdatum']).weekday == day &&
        lesson['roosterdatum'] == formattedDate) {
      newLessons.add(lesson);
    }
  }

  return newLessons;
}
