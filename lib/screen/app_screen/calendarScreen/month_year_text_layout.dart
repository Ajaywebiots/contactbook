import 'package:contactbook/common/theme/app_color.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendarCommonScreen.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/app_screem_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

class MonthYearTextLayout extends StatelessWidget {
  const MonthYearTextLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      builder: (calendarCtrl) => Padding(
          padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right:20),
          child: ValueListenableBuilder<DateTime>(
              valueListenable: calendarCtrl.focusedDay,
              builder: (context, value, _) {
                final headerText = DateFormat.yMMM().format(value);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CalendarCommonScreen().commonText(headerText,
                        fontSize: 20,
                        color: AppColor().primaryColor,
                        fontWeight: FontWeight.w600)
                  ],
                );
              })),
    );
  }
}
