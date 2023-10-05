// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';


class DaysEventController extends GetxController {
  //event add days wise and never function
  daysWiseAndNeverEvent(value) async {
    var calendarCtrl = Get.isRegistered<CalendarController>()
        ? Get.find<CalendarController>()
        : Get.put(CalendarController());

    if (value['repetitionFinalValues'] == "day") {
      List dateList = [];
      var valData;
      int totalLength = 0;
      dynamic storageData = [];
      if (value['endSelection'] == "never") {
        totalLength = 365;
      } else if (value['endSelection'] == "on") {
        DateTime currentDate = calendarCtrl.focusedDay
            .value; // TODO: change this to your DateTime from firebase
        DateTime endDate = DateTime.parse(value['endDate']);
        int lengthDay = endDate.difference(currentDate).inDays;

        totalLength = lengthDay + 2;
      } else {
        totalLength = int.parse(value["occurrenceText"]);
      }
      DateTime lastDate = calendarCtrl.focusedDay.value;
      for (var i = 0; i < totalLength; i++) {
        value['date'] = "";
        if (i == 0) {
          calendarCtrl.focusedDay.value = DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day);
        } else {
          dateList.add(
              DateFormat('yyyy-MM-dd').format(calendarCtrl.focusedDay.value));

          if (!dateList.contains(DateFormat('yyyy-MM-dd').format(DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day + 1)))) {
            calendarCtrl.focusedDay.value = DateTime.utc(
                calendarCtrl.focusedDay.value.year,
                calendarCtrl.focusedDay.value.month,
                calendarCtrl.focusedDay.value.day + 1);
          }
          lastDate = calendarCtrl.focusedDay.value;
          update();
        }
        calendarCtrl.update();
        value['index'] = i.toString();

        await calendarCtrl.setData(value, i);

        calendarCtrl.focusedDay.value = lastDate;
        calendarCtrl.update();

        valData = null;
        valData = value;
        // storageData = await Helper().getStorage('calendarDataDetail') ?? [];

        valData['date'] = DateFormat('yyyy-MM-dd').format(lastDate);
        // await Helper().removeSpecificKeyStorage('calendarDataDetail');

        await storageData.add(valData);
      }
      // await Helper().writeStorage('calendarDataDetail', storageData);
      //dynamic sss = await Helper().getStorage('calendarDataDetail') ?? [];

      calendarCtrl.focusedDay.value = calendarCtrl.focusedDayDD.value;
      calendarCtrl.update();
      calendarCtrl.dateWiseData =
          calendarCtrl.selectDate[calendarCtrl.focusedDay.value];
    } else {
      DateTime lastDate = calendarCtrl.focusedDay.value;
      int count = int.parse(value['repeatText']);

      int totalLength = 0;
      if (value['endSelection'] == "never") {
        double day = 365 / 2;
        int lengthDay = day.round();
        totalLength = lengthDay;
      } else if (value['endSelection'] == "on") {
        DateTime currentDate = calendarCtrl.focusedDay
            .value; // TODO: change this to your DateTime from firebase
        DateTime endDate = DateTime.parse(value['endDate']);
        int lengthDay = endDate.difference(currentDate).inDays;

        double day = lengthDay / 2;
        int totalLength = day.floor();
        totalLength = totalLength + 2;
      } else {
        totalLength = int.parse(value["occurrenceText"]);
      }

      List dateList = [];
      for (var i = 0; i < totalLength; i++) {
        if (i != 0) {
          dateList.add(
              DateFormat('yyyy-MM-dd').format(calendarCtrl.focusedDay.value));

          if (!dateList.contains(DateFormat('yyyy-MM-dd').format(DateTime.utc(
              calendarCtrl.focusedDay.value.year,
              calendarCtrl.focusedDay.value.month,
              calendarCtrl.focusedDay.value.day + count)))) {
            calendarCtrl.focusedDay.value = DateTime.utc(
                calendarCtrl.focusedDay.value.year,
                calendarCtrl.focusedDay.value.month,
                calendarCtrl.focusedDay.value.day + count);
          }
          lastDate = calendarCtrl.focusedDay.value;

          value['index'] = i.toString();
          // await Helper().writeStorage('calendarDataDetail', value);
          await calendarCtrl.setData(value, i);
          calendarCtrl.focusedDay.value = lastDate;
          calendarCtrl.update();
        } else {
          await calendarCtrl.setData(value, i);
          calendarCtrl.focusedDay.value = lastDate;
          calendarCtrl.update();
        }
      }
    }
  }
}
