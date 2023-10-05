import 'package:contactbook/screen/app_screen/calendarScreen/common_day.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

import 'calendar_controller.dart';

class MonthsController extends GetxController {
  monthWeekDay(value) async {
    var calendarCtrl = Get.isRegistered<CalendarController>()
        ? Get.find<CalendarController>()
        : Get.put(CalendarController());
    DateTime oldDate = calendarCtrl.focusedDay.value;
    int totalLength = 0;
    DateTime lastDate = DateTime.now();
    int repeatText = int.parse(value["repeatText"]);
    if (value['endSelection'] == "never") {
      totalLength = 7;
      lastDate = DateTime.utc(calendarCtrl.focusedDay.value.year +1,calendarCtrl.focusedDay.value.month,calendarCtrl.focusedDay.value.day);
    } else if (value['endSelection'] == "on") {
      lastDate = DateTime.parse(value['endDate']);
      int month = lastDate.month - oldDate.month;
      totalLength = month.abs() + 1;

    }else{
      totalLength = int.parse(value['occurrenceText']);
      lastDate = DateTime.utc(calendarCtrl.focusedDay.value.year +1,calendarCtrl.focusedDay.value.month,calendarCtrl.focusedDay.value.day);
    }
    update();

    for (var i = 0; i < totalLength; i++) {
      if (value['monthSelection'] ==
          "Monthly on day ${DateFormat("d").format(calendarCtrl.focusedDay.value)}") {
        if (i == 0) {
          calendarCtrl.focusedDay.value = DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day);

          oldDate = calendarCtrl.focusedDay.value;
          await calendarCtrl.setData(value, i);
        } else {
          if (DateTime.utc(
                  calendarCtrl.focusedDay.value.year,
                  calendarCtrl.focusedDay.value.month + repeatText,
                  calendarCtrl.focusedDay.value.day)
              .isBefore(lastDate)) {
            calendarCtrl.focusedDay.value = DateTime.utc(
                calendarCtrl.focusedDay.value.year,
                calendarCtrl.focusedDay.value.month + repeatText,
                calendarCtrl.focusedDay.value.day);

            calendarCtrl.update();
            oldDate = calendarCtrl.focusedDay.value;
            await calendarCtrl.setData(value, i);
          }else{
            calendarCtrl.focusedDay.value = calendarCtrl.currentDate;
            calendarCtrl.update();
            break;
          }

        }
        calendarCtrl.focusedDay.value = oldDate;
        calendarCtrl.update();
      } else {
        if (i == 0) {
          calendarCtrl.focusedDay.value = DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day);

        } else {
          if (DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month + repeatText,
              calendarCtrl.focusedDay.value.day)
              .isBefore(lastDate)) {
            calendarCtrl.focusedDay.value = DateTime.utc(
                calendarCtrl.focusedDay.value.year,
                calendarCtrl.focusedDay.value.month + repeatText,
                1);

            oldDate = calendarCtrl.focusedDay.value;
          }else{
            calendarCtrl.focusedDay.value = calendarCtrl.currentDate;
            calendarCtrl.update();
            break;
          }
        }

        if (value['monthSelection'].contains("First")) {
          if (value['monthSelection'].contains("Monday")) {
            CommonDay()
                .commonMonthFirstWeekDay(value, "Monday", DateTime.monday);
          } else if (value['monthSelection'].contains("Tuesday")) {

            CommonDay()
                .commonMonthFirstWeekDay(value, "Tuesday", DateTime.tuesday);
          } else if (value['monthSelection'].contains("Wednesday")) {

            CommonDay().commonMonthFirstWeekDay(
                value, "Wednesday", DateTime.wednesday);
          } else if (value['monthSelection'].contains("Thursday")) {

            CommonDay()
                .commonMonthFirstWeekDay(value, "Thursday", DateTime.thursday);
          } else if (value['monthSelection'].contains("Friday")) {

            CommonDay()
                .commonMonthFirstWeekDay(value, "Friday", DateTime.friday);
          } else if (value['monthSelection'].contains("Saturday")) {

            CommonDay()
                .commonMonthFirstWeekDay(value, "Saturday", DateTime.saturday);
          } else if (value['monthSelection'].contains("Sunday")) {

            CommonDay()
                .commonMonthFirstWeekDay(value, "Sunday", DateTime.sunday);
          }
          await calendarCtrl.setData(value, i);
          calendarCtrl.focusedDay.value = oldDate;
          calendarCtrl.update();
        } else if (value['monthSelection'].contains("Second")) {

          if (value['monthSelection'].contains("Monday")) {
            CommonDay()
                .commonMonthSecondWeekDay(value, "Monday", DateTime.monday, i);
          } else if (value['monthSelection'].contains("Tuesday")) {

            CommonDay().commonMonthSecondWeekDay(
                value, "Tuesday", DateTime.tuesday, i);
          } else if (value['monthSelection'].contains("Wednesday")) {

            CommonDay().commonMonthSecondWeekDay(
                value, "Wednesday", DateTime.wednesday, i);
          } else if (value['monthSelection'].contains("Thursday")) {

            CommonDay().commonMonthSecondWeekDay(
                value, "Thursday", DateTime.thursday, i);
          } else if (value['monthSelection'].contains("Friday")) {

            CommonDay()
                .commonMonthSecondWeekDay(value, "Friday", DateTime.friday, i);
          } else if (value['monthSelection'].contains("Saturday")) {

            CommonDay().commonMonthSecondWeekDay(
                value, "Saturday", DateTime.saturday, i);
          } else if (value['monthSelection'].contains("Sunday")) {

            CommonDay()
                .commonMonthSecondWeekDay(value, "Sunday", DateTime.sunday, i);
          }
          await calendarCtrl.setData(value, i);
          calendarCtrl.focusedDay.value = oldDate;
          calendarCtrl.update();
        } else if (value['monthSelection'].contains("Third")) {
          if (value['monthSelection'].contains("Monday")) {
            CommonDay()
                .commonMonthThirdWeekDay(value, "Monday", DateTime.monday, i);
          } else if (value['monthSelection'].contains("Tuesday")) {

            CommonDay()
                .commonMonthThirdWeekDay(value, "Tuesday", DateTime.tuesday, i);
          } else if (value['monthSelection'].contains("Wednesday")) {

            CommonDay().commonMonthThirdWeekDay(
                value, "Wednesday", DateTime.wednesday, i);
          } else if (value['monthSelection'].contains("Thursday")) {

            CommonDay().commonMonthThirdWeekDay(
                value, "Thursday", DateTime.thursday, i);
          } else if (value['monthSelection'].contains("Friday")) {

            CommonDay()
                .commonMonthThirdWeekDay(value, "Friday", DateTime.friday, i);
          } else if (value['monthSelection'].contains("Saturday")) {

            CommonDay().commonMonthThirdWeekDay(
                value, "Saturday", DateTime.saturday, i);
          } else if (value['monthSelection'].contains("Sunday")) {

            CommonDay()
                .commonMonthThirdWeekDay(value, "Sunday", DateTime.sunday, i);
          }
          await calendarCtrl.setData(value, i);
          calendarCtrl.focusedDay.value = oldDate;
          calendarCtrl.update();
        } else if (value['monthSelection'].contains("Forth")) {
          if (value['monthSelection'].contains("Monday")) {
            CommonDay()
                .commonMonthForthWeekDay(value, "Monday", DateTime.monday, i);
          } else if (value['monthSelection'].contains("Tuesday")) {

            CommonDay()
                .commonMonthForthWeekDay(value, "Tuesday", DateTime.tuesday, i);
          } else if (value['monthSelection'].contains("Wednesday")) {

            CommonDay().commonMonthForthWeekDay(
                value, "Wednesday", DateTime.wednesday, i);
          } else if (value['monthSelection'].contains("Thursday")) {

            CommonDay().commonMonthForthWeekDay(
                value, "Thursday", DateTime.thursday, i);
          } else if (value['monthSelection'].contains("Friday")) {

            CommonDay()
                .commonMonthForthWeekDay(value, "Friday", DateTime.friday, i);
          } else if (value['monthSelection'].contains("Saturday")) {

            CommonDay().commonMonthForthWeekDay(
                value, "Saturday", DateTime.saturday, i);
          } else if (value['monthSelection'].contains("Sunday")) {

            CommonDay()
                .commonMonthForthWeekDay(value, "Sunday", DateTime.sunday, i);
          }
          await calendarCtrl.setData(value, i);
          calendarCtrl.focusedDay.value = oldDate;
          calendarCtrl.update();
        } else if (value['monthSelection'].contains("Fifth")) {
          if (value['monthSelection'].contains("Monday")) {
            CommonDay()
                .commonMonthFifthWeekDay(value, "Monday", DateTime.monday, i);
          } else if (value['monthSelection'].contains("Tuesday")) {

            CommonDay()
                .commonMonthFifthWeekDay(value, "Tuesday", DateTime.tuesday, i);
          } else if (value['monthSelection'].contains("Wednesday")) {

            CommonDay().commonMonthFifthWeekDay(
                value, "Wednesday", DateTime.wednesday, i);
          } else if (value['monthSelection'].contains("Thursday")) {

            CommonDay().commonMonthFifthWeekDay(
                value, "Thursday", DateTime.thursday, i);
          } else if (value['monthSelection'].contains("Friday")) {

            CommonDay()
                .commonMonthFifthWeekDay(value, "Friday", DateTime.friday, i);
          } else if (value['monthSelection'].contains("Saturday")) {

            CommonDay().commonMonthFifthWeekDay(
                value, "Saturday", DateTime.saturday, i);
          } else if (value['monthSelection'].contains("Sunday")) {

            CommonDay()
                .commonMonthFifthWeekDay(value, "Sunday", DateTime.sunday, i);
          }
          await calendarCtrl.setData(value, i);
          calendarCtrl.focusedDay.value = oldDate;
          calendarCtrl.update();
        }
      }
      calendarCtrl.focusedDay.value = calendarCtrl.currentDate;
      calendarCtrl.update();
    }
  }
}
