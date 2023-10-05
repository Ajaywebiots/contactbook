import 'package:contactbook/provider/date_time_provider.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/calendar_common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_color.dart';

class MonthYearTextLayout extends StatelessWidget {
  const MonthYearTextLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
    return Consumer(
        builder: (context, value, child) => Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ValueListenableBuilder<DateTime>(
                valueListenable: focusedDay,
                builder: (context, value, _) {
                  final headerText = DateFormat.yMMM().format(value);
                  return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CalendarCommonScreen().commonText(headerText,
                            fontSize: 20,
                            color: AppColor().primaryColor,
                            fontWeight: FontWeight.w600)
                      ]);
                })));
  }
}
