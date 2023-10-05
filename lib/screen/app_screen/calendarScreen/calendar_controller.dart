import 'dart:collection';
import 'dart:convert';
import 'package:contactbook/screen/app_screen/calendarScreen/calendar_plugin_custom.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/day_event_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/delete_plan_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/month_weekday.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/months_week_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/wee_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  PageController? pageController;
  int counter = 0;
  late Map<DateTime, List<dynamic>> selectDate;
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> focusedDayDD = ValueNotifier(DateTime.now());
  SharedPreferences? prefs;
  DateTime currentDate = DateTime.now();
  int totalSkipped = 0;
  int totalCompete = 0;
  String deleteOption = "";

  var daysCtrl = Get.isRegistered<DaysEventController>()
      ? Get.find<DaysEventController>()
      : Get.put(DaysEventController());
  var weekCtrl = Get.isRegistered<WeekWiseEventController>()
      ? Get.find<WeekWiseEventController>()
      : Get.put(WeekWiseEventController());
  var monthCtrl = Get.isRegistered<MonthlyWeekDayMonthController>()
      ? Get.find<MonthlyWeekDayMonthController>()
      : Get.put(MonthlyWeekDayMonthController());
  var monthsCtrl = Get.isRegistered<MonthsController>()
      ? Get.find<MonthsController>()
      : Get.put(MonthsController());
  var deleteCtrl = Get.isRegistered<DeletePlanController>()
      ? Get.find<DeletePlanController>()
      : Get.put(DeletePlanController());

  // DateTime selectedDay = DateTime.now();
  final Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? rangeStart;
  DateTime? rangeEnd;


  dynamic data = [];
  dynamic dateWiseData = [];
  String? userName = '';
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectDate = {};
    selectDate[focusedDay.value] = [];

    getData();
  }

  //get data from storage
  getData() async {
    focusedDay.value = DateTime.utc(focusedDay.value.year,
        focusedDay.value.month, focusedDay.value.day + 0);
    update();


    prefs = await SharedPreferences.getInstance();

    update();
    totalSkipped = 0;
    totalCompete = 0;
    onDaySelected(focusedDay.value, focusedDay.value);
  }

  @override
  void dispose() {
    focusedDay.dispose();
    super.dispose();
  }

  bool get canClearSelection =>
      selectedDays.isNotEmpty || rangeStart != null || rangeEnd != null;

  //event show in calendar
  List<dynamic> getEventsForDay(DateTime day) {
    return selectDate[day] ?? [];
  }

  //on day select tap
  void onDaySelected(DateTime selectDay, DateTime _focusedDay) {
    focusedDay.value = selectDay;
    update();

    DateTime now = DateTime.now();

    data = selectDate[focusedDay.value];

    DateTime date1 = DateTime.parse(DateFormat('yyyy-MM-dd').format(now));
    DateTime date2 =
        DateTime.parse(DateFormat('yyyy-MM-dd').format(focusedDay.value));

    if (date2.isAfter(date1) || date2.compareTo(date1) == 0) {
      dateWiseData = [];

      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          data[i]['listIndex'] = i.toString();
        }
      }
      dateWiseData = data;
      update();
      if (dateWiseData != null) {
        for (int i = 0; i < dateWiseData.length; i++) {
          dateWiseData[i]['listIndex'] = i.toString();
          if (dateWiseData[i]['status'] == "Exercise Skipped") {
            totalSkipped++;
          }
          if (dateWiseData[i]['status'] == "Exercise Done") {
            totalCompete++;
          }
        }
      }
      update();
    } else {

    }
    currentDate = focusedDay.value;
    update();
  }

  //set exercise list in storage
  setData(value, int index) async {
    if (selectDate[focusedDay.value] != null) {
      selectDate[focusedDay.value]?.add(
        value,
      );
      update();
    } else {
      selectDate[focusedDay.value] = [
        value,
      ];
      update();
    }

  }
}
