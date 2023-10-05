import 'package:contactbook/common/theme/app_color.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendarCommonScreen.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendar_plugin_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
        builder: (calendarCtrl) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: TableCalendar(
                rowHeight: 32,
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: calendarCtrl.focusedDay.value,
                calendarStyle: CalendarStyle(
                    disabledDecoration:
                        CalendarCommonScreen().decoration(AppColor().redColor),
                    markerDecoration: CalendarCommonScreen()
                        .decoration(AppColor().primaryColor),
                    selectedDecoration: CalendarCommonScreen()
                        .decoration(AppColor().inProgressColor),
                    holidayDecoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(
                            color: AppColor().primaryColor, width: 1.4)),
                        shape: BoxShape.circle),
                    todayDecoration: BoxDecoration(
                        color: AppColor().gray.withOpacity(.5),
                        border: Border.fromBorderSide(
                            BorderSide(color: AppColor().gray.withOpacity(.0))),
                        shape: BoxShape.circle),
                    rangeStartTextStyle: CalendarCommonScreen()
                        .commonCalendarTextStyle(AppColor().primaryColor),
                    todayTextStyle: CalendarCommonScreen()
                        .commonCalendarTextStyle(AppColor().whiteColor),
                    defaultTextStyle: CalendarCommonScreen()
                        .commonCalendarTextStyle(AppColor().primaryColor),
                    disabledTextStyle: CalendarCommonScreen()
                        .commonCalendarTextStyle(AppColor().primaryColor),
                    outsideTextStyle: CalendarCommonScreen()
                        .commonCalendarTextStyle(AppColor().primaryColor),
                    selectedTextStyle: CalendarCommonScreen()
                        .commonCalendarTextStyle(AppColor().whiteColor),
                    rangeEndTextStyle: CalendarCommonScreen().commonCalendarTextStyle(AppColor().primaryColor),
                    holidayTextStyle: CalendarCommonScreen().commonCalendarTextStyle(AppColor().primaryColor),
                    weekendTextStyle: CalendarCommonScreen().commonCalendarTextStyle(AppColor().primaryColor)),
                headerVisible: false,
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(calendarCtrl.focusedDay.value, date);
                },
                calendarFormat: calendarCtrl.calendarFormat,
                eventLoader: calendarCtrl.getEventsForDay,
                daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: AppColor().whiteColor), weekendStyle: TextStyle(color: AppColor().whiteColor)),
                onDaySelected: calendarCtrl.onDaySelected,
                onCalendarCreated: (controller) => calendarCtrl.pageController = controller,
                onPageChanged: (focusedDay) => calendarCtrl.focusedDay.value = focusedDay)));
  }
}
