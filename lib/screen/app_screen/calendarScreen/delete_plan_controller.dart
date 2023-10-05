import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeletePlanController extends GetxController {
  late Map<DateTime, List<dynamic>> selectDate;
  late Map<DateTime, List<dynamic>> selectDatesss;
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> currentDate = ValueNotifier(DateTime.now());
  SharedPreferences? prefs;
  dynamic data;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  //delete exercise
  deletePlan(title, index, exerciseName, status, {focusDate}) async {
    selectDate = {};
    selectDate[focusedDay.value] = [];
    focusedDay.value = focusDate ??
        DateTime.utc(focusedDay.value.year, focusedDay.value.month,
            focusedDay.value.day);
    prefs = await SharedPreferences.getInstance();

    selectDatesss = selectDate;
    update();
    selectDate.remove(true);

    //delete for today or for all following exercise plan
    if (title == "today") {
      selectDatesss[focusedDay.value]!.removeAt(index);
    } else {
      for (var i = 0; i < selectDatesss.length; i++) {
        focusedDay.value = selectDatesss.keys.elementAt(i);

        if (selectDatesss[focusedDay.value] != null &&
            selectDatesss[focusedDay.value]!.isNotEmpty) {
          for (var j = 0; j < selectDatesss[focusedDay.value]!.length; j++) {
            if (selectDatesss[focusedDay.value]![j]['title'] == exerciseName) {
              if (selectDatesss[focusedDay.value]![j]['status'] ==
                  'Exercise Not Started') {
                selectDatesss[focusedDay.value]!.removeAt(j);
              }
            }
          }
        }
      }
    }
  }
}
