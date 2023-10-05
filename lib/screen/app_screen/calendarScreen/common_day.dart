import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonDay {
  var calendarCtrl = Get.isRegistered<CalendarController>()
      ? Get.find<CalendarController>()
      : Get.put(CalendarController());

  commonDay(repeatOnList, day, date, value, int i) async {
      if (repeatOnList.contains(day)) {
      if (DateFormat.EEEE().format(date) == day) {
        calendarCtrl.counter++;

        calendarCtrl.update();

        await calendarCtrl.setData(value, i);
      }
    }
  }

  commonDayForSelectDate(repeatOnList, day, dateList, oldVal, int lengthDay,
      lastDate, value, int number, totalLength) async {
    int occurrenceText = 0;

      if (repeatOnList.contains(day)) {
      for (var i = 0; i < totalLength; i++) {
        if (dateList.length == 0) {
          calendarCtrl.focusedDay.value = DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day + 1);
          oldVal = calendarCtrl.focusedDay.value;
        } else {
          DateTime giveDate = DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day + lengthDay);
          if (giveDate.isAfter(lastDate)) {

            break;
          } else {
            if (!dateList.contains(DateFormat('yyyy-MM-dd').format(DateTime.utc(
                calendarCtrl.focusedDay.value.year,
                calendarCtrl.focusedDay.value.month,
                calendarCtrl.focusedDay.value.day + lengthDay)))) {
              calendarCtrl.focusedDay.value = DateTime.utc(
                  calendarCtrl.focusedDay.value.year,
                  calendarCtrl.focusedDay.value.month,
                  calendarCtrl.focusedDay.value.day + lengthDay);
            }
            calendarCtrl.update();
          }
        }
        if (value['endSelection'] != "after") {
          if (DateFormat.EEEE().format(calendarCtrl.focusedDay.value) == day) {
            oldVal = calendarCtrl.focusedDay.value;
            dateList.add(
                DateFormat('yyyy-MM-dd').format(calendarCtrl.focusedDay.value));
            calendarCtrl.update();
            await calendarCtrl.setData(value, number);
          }
          calendarCtrl.focusedDay.value = oldVal;
          calendarCtrl.update();
        } else {
          if (calendarCtrl.counter == occurrenceText) {
            break;
          } else {
            if (DateFormat.EEEE().format(calendarCtrl.focusedDay.value) ==
                day) {
              oldVal = calendarCtrl.focusedDay.value;
              dateList.add(
                  DateFormat('yyyy-MM-dd').format(
                      calendarCtrl.focusedDay.value));
              calendarCtrl.counter++;
              calendarCtrl.update();

              await calendarCtrl.setData(value, number);
            }
            calendarCtrl.focusedDay.value = oldVal;
            calendarCtrl.update();
          }
        }
      }
    }

  }

  commonMonthFirstWeekDay(value, day, int dateWeek) async {
    if (DateFormat("EEEE").format(calendarCtrl.focusedDay.value) == day) {

    } else {
      DateTime nextNextMonday =
          getNextWeekDay(dateWeek, from: calendarCtrl.focusedDay.value);
      calendarCtrl.focusedDay.value = DateTime.parse(nextNextMonday.toString());
      calendarCtrl.update();

    }
  }

  commonMonthSecondWeekDay(value, day, int dateWeek, index) async {
    if (index == 0) {

    } else {
      DateTime nextNextMonday =
          getNextWeekDay(dateWeek, from: calendarCtrl.focusedDay.value);
      calendarCtrl.focusedDay.value = DateTime.parse(nextNextMonday.toString());
      calendarCtrl.update();

    }
  }

  commonMonthThirdWeekDay(value, day, int dateWeek, index) async {
    if (index == 0) {

    } else {
      DateTime nextMonday =
          getNextWeekDay(dateWeek, from: calendarCtrl.focusedDay.value);
      DateTime nextNextMonday = getNextWeekDay(dateWeek, from: nextMonday);
      calendarCtrl.focusedDay.value = DateTime.parse(nextNextMonday.toString());
      calendarCtrl.update();

    }
  }

  commonMonthForthWeekDay(value, day, int dateWeek, index) async {
    if (index == 0) {

    } else {
      DateTime nextMonday =
          getNextWeekDay(dateWeek, from: calendarCtrl.focusedDay.value);
      DateTime nextNextMonday = getNextWeekDay(dateWeek, from: nextMonday);
      DateTime nextNextMondays =
          getNextWeekDay(dateWeek, from: nextNextMonday);
      calendarCtrl.focusedDay.value =
          DateTime.parse(nextNextMondays.toString());
      calendarCtrl.update();

    }
  }

  commonMonthFifthWeekDay(value, day, int dateWeek, index) async {
    if (index == 0) {

    } else {
      DateTime nextMonday =
          getNextWeekDay(dateWeek, from: calendarCtrl.focusedDay.value);
      DateTime nextNextMonday = getNextWeekDay(dateWeek, from: nextMonday);
      DateTime nextNextMondayss =
          getNextWeekDay(dateWeek, from: nextNextMonday);
      DateTime nextNextFifth = getNextWeekDay(dateWeek, from: nextNextMondayss);
      calendarCtrl.focusedDay.value = DateTime.parse(nextNextFifth.toString());
      calendarCtrl.update();

    }
  }
}

extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var wom = 0;
    var date = this;

    while (date.month == month) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }
}

DateTime getNextWeekDay(int weekDay, {DateTime? from}) {
  DateTime now = DateTime.now();

  if (from != null) {
    now = from;
  }

  int remainDays = weekDay - now.weekday + 7;

  return now.add(Duration(days: remainDays));
}

class DateTimes {
  static const int monday = 1;
  static const int tuesday = 2;
  static const int wednesday = 3;
  static const int thursday = 4;
  static const int friday = 5;
  static const int saturday = 6;
  static const int sunday = 7;
}
