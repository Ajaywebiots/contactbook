import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/common_day.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class WeekWiseEventController extends GetxController {
  //week wise never
  weekWiseNever(value) async {
    var calendarCtrl = Get.isRegistered<CalendarController>()
        ? Get.find<CalendarController>()
        : Get.put(CalendarController());

    if (value['repetitionFinalValues'] == "week") {
      List dateList = [];
      int totalLength = 0;
      int occurrenceText = 0;
      if (value['endSelection'] == "never") {
        totalLength = 365;
      } else if (value['endSelection'] == "on") {
        DateTime currentDate = calendarCtrl.focusedDay
            .value; // TODO: change this to your DateTime from firebase
        DateTime endDate = DateTime.parse(value['endDate']);
        int lengthDay = endDate.difference(currentDate).inDays;
        totalLength = lengthDay;
      } else {
        totalLength = 365;
        occurrenceText = int.parse(value["occurrenceText"]);
      }
      String repeatOnList = value['repeatOnList'];
      for (var i = 0; i < totalLength; i++) {
        dateList.add(
            DateFormat('yyyy-MM-dd').format(calendarCtrl.focusedDay.value));
        if (i != 0) {
          if (!dateList.contains(DateFormat('yyyy-MM-dd').format(DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day + 1)))) {
            calendarCtrl.focusedDay.value = DateTime.utc(
                calendarCtrl.focusedDay.value.year,
                calendarCtrl.focusedDay.value.month,
                calendarCtrl.focusedDay.value.day + 1);
          }
        }
        if (value['endSelection'] != "after") {
          CommonDay().commonDay(
              repeatOnList, "Monday", calendarCtrl.focusedDay.value, value, i);
          CommonDay().commonDay(
              repeatOnList, "Tuesday", calendarCtrl.focusedDay.value, value, i);
          CommonDay().commonDay(repeatOnList, "Wednesday",
              calendarCtrl.focusedDay.value, value, i);
          CommonDay().commonDay(repeatOnList, "Thursday",
              calendarCtrl.focusedDay.value, value, i);
          CommonDay().commonDay(
              repeatOnList, "Friday", calendarCtrl.focusedDay.value, value, i);
          CommonDay().commonDay(repeatOnList, "Saturday",
              calendarCtrl.focusedDay.value, value, i);
          CommonDay().commonDay(
              repeatOnList, "Sunday", calendarCtrl.focusedDay.value, value, i);
        } else {
          if (calendarCtrl.counter == occurrenceText) {
            calendarCtrl.counter = 0;
            calendarCtrl.focusedDay.value = calendarCtrl.currentDate;
            calendarCtrl.update();
            break;
          } else {
            CommonDay().commonDay(repeatOnList, "Monday",
                calendarCtrl.focusedDay.value, value, i);
            CommonDay().commonDay(repeatOnList, "Tuesday",
                calendarCtrl.focusedDay.value, value, i);
            CommonDay().commonDay(repeatOnList, "Wednesday",
                calendarCtrl.focusedDay.value, value, i);
            CommonDay().commonDay(repeatOnList, "Thursday",
                calendarCtrl.focusedDay.value, value, i);
            CommonDay().commonDay(repeatOnList, "Friday",
                calendarCtrl.focusedDay.value, value, i);
            CommonDay().commonDay(repeatOnList, "Saturday",
                calendarCtrl.focusedDay.value, value, i);
            CommonDay().commonDay(repeatOnList, "Sunday",
                calendarCtrl.focusedDay.value, value, i);
          }
        }
      }
    } else {
      int count = int.parse(value['repeatText']);
      int lengthDay = count * 7;
      List dateList = [];
      List data = [];
      String repeatOnList = value['repeatOnList'];

      DateTime oldVal = calendarCtrl.focusedDay.value;
      DateTime lastDate = DateTime.utc(
          calendarCtrl.focusedDay.value.year + 1,
          calendarCtrl.focusedDay.value.month,
          calendarCtrl.focusedDay.value.day);

      int occurrenceText = 0;
      int totalLength = 0;
      double bval = 365 / 2;
      totalLength = bval.round();
      if (value['endSelection'] == "never") {
        lastDate = DateTime.utc(
            calendarCtrl.focusedDay.value.year + 1,
            calendarCtrl.focusedDay.value.month,
            calendarCtrl.focusedDay.value.day);
      } else if (value['endSelection'] == "on") {
        lastDate = DateTime.parse(value['endDate']);
      } else {
        lastDate = DateTime.utc(
            calendarCtrl.focusedDay.value.year,
            calendarCtrl.focusedDay.value.month,
            calendarCtrl.focusedDay.value.day + occurrenceText);
        occurrenceText = int.parse(value['occurrenceText']);
      }

      update();

      for (var i = 0; i < totalLength; i++) {
        dateList.add(
            DateFormat('yyyy-MM-dd').format(calendarCtrl.focusedDay.value));
        if (i != 0) {
          if (!dateList.contains(DateFormat('yyyy-MM-dd').format(DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day + 1)))) {
            calendarCtrl.focusedDay.value = DateTime.utc(
                calendarCtrl.focusedDay.value.year,
                calendarCtrl.focusedDay.value.month,
                calendarCtrl.focusedDay.value.day + 1);
          }
          oldVal = calendarCtrl.focusedDay.value;
        }
        if (value['endSelection'] != "after") {
          if (lastDate.isBefore(calendarCtrl.focusedDay.value)) {
            calendarCtrl.focusedDay.value = calendarCtrl.currentDate;
            calendarCtrl.update();
            break;
          } else {
            if (repeatOnList.contains(
                DateFormat.EEEE().format(calendarCtrl.focusedDay.value))) {
              data.add(calendarCtrl.focusedDay.value);
              await calendarCtrl.setData(value, i);
              calendarCtrl.focusedDay.value = oldVal;
              calendarCtrl.update();
            }

            if (DateFormat("EEEE").format(calendarCtrl.focusedDay.value) ==
                "Sunday") {
              if (data.isNotEmpty) {
                calendarCtrl.focusedDay.value = DateTime.utc(
                    data[0].year, data[0].month, data[0].day + lengthDay);
                data = [];
                calendarCtrl.focusedDay.value = DateTime.utc(
                    calendarCtrl.focusedDay.value.year,
                    calendarCtrl.focusedDay.value.month,
                    calendarCtrl.focusedDay.value.day - 1);
                update();
              }
            }
          }
        } else {
          if (calendarCtrl.counter == occurrenceText) {
            calendarCtrl.counter = 0;
            calendarCtrl.update();
            break;
          } else {
            if (repeatOnList.contains(
                DateFormat.EEEE().format(calendarCtrl.focusedDay.value))) {
              data.add(calendarCtrl.focusedDay.value);
              calendarCtrl.counter++;
              await calendarCtrl.setData(value, i);
              calendarCtrl.focusedDay.value = oldVal;
              calendarCtrl.update();
            }

            if (DateFormat("EEEE").format(calendarCtrl.focusedDay.value) ==
                "Sunday") {
              if (data.isNotEmpty) {
                calendarCtrl.focusedDay.value = DateTime.utc(
                    data[0].year, data[0].month, data[0].day + lengthDay);
                data = [];
                calendarCtrl.focusedDay.value = DateTime.utc(
                    calendarCtrl.focusedDay.value.year,
                    calendarCtrl.focusedDay.value.month,
                    calendarCtrl.focusedDay.value.day - 1);
                update();
              }
            }
          }
        }

        calendarCtrl.update();
      }
    }
  }
}
