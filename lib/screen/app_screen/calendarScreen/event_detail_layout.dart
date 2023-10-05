import 'package:contactbook/screen/app_screen/calendarScreen/calendarScreen_style.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/timeline_process.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetailLayout extends StatelessWidget {
  const EventDetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      builder: (calendarCtrl) =>
      calendarCtrl.dateWiseData != null &&
          calendarCtrl.dateWiseData.length > 0
          ? CalendarScreenStyle().eventDetailScreenStyle(
          child: SingleChildScrollView(
            child: Stack(
                alignment: calendarCtrl.data != null &&
                    calendarCtrl.data != "" &&
                    calendarCtrl.data.length > 0
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (calendarCtrl.data != null &&
                            calendarCtrl.data != "" &&
                            calendarCtrl.data.length > 0)
                          Timeline2(
                            data: calendarCtrl.dateWiseData,
                            userName: calendarCtrl.userName,
                            dataList: calendarCtrl.data,
                            date: calendarCtrl.focusedDay.value,
                            deleteOption: calendarCtrl.deleteOption,
                            onChanged: (val) {
                              calendarCtrl.deleteOption = val;
                              calendarCtrl.update();
                            },
                            onChanged2: (val) {
                              calendarCtrl.deleteOption = val;
                              calendarCtrl.update();
                            },
                          )

                      ]
                  ),
                ]
            ),
          ),
          context: context)
          : Container(),
    );
  }
}
