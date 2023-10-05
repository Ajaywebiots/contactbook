import 'package:contactbook/screen/app_screen/calendarScreen/day_event_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../calendarScreen/calendar_controller.dart';
import '../date_&_time/layouts/callendar_style.dart';
import 'month_weekday.dart';
import 'months_week_controller.dart';
import 'wee_event_controller.dart';

class AddExerciseLayout extends StatelessWidget {
  const AddExerciseLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      builder: (calendarCtrl) => GetBuilder<DaysEventController>(builder: (daysEventCtrl) {
        return GetBuilder<WeekWiseEventController>(builder: (weekCtrl) {
          return GetBuilder<MonthsController>(builder: (weeksCtrl) {
            return GetBuilder<MonthlyWeekDayMonthController>(
                builder: (monthCtrl) {
                  return CalendarScreenStyle().addExerciseButtonStyle(onTap: () {
                    Get.toNamed(
                      RouteName().exerciseList,
                    )!
                        .then((value) async {
                      calendarCtrl.isLoading = true;

                      calendarCtrl.focusedDayDD.value =
                          calendarCtrl.focusedDay.value;
                      calendarCtrl.update();
                      if (value != null && value != "") {

                        if ((value['repetitionFinalValues'] == "day" ||
                            value['repetitionFinalValues'] == "days")) {
                          await daysEventCtrl.daysWiseAndNeverEvent(value);
                          calendarCtrl.focusedDay.value =
                              calendarCtrl.focusedDayDD.value;
                          calendarCtrl.update();
                          calendarCtrl.dateWiseData = calendarCtrl
                              .selectDate[calendarCtrl.focusedDay.value];
                          calendarCtrl.update();
                        } else if ((value['repetitionFinalValues'] == "week" ||
                            value['repetitionFinalValues'] == "weeks")) {
                          await weekCtrl.weekWiseNever(value);
                          calendarCtrl.focusedDay.value =
                              calendarCtrl.focusedDayDD.value;
                          calendarCtrl.counter = 0;
                          calendarCtrl.update();
                          calendarCtrl.dateWiseData = calendarCtrl
                              .selectDate[calendarCtrl.focusedDay.value];
                          calendarCtrl.update();
                        } else if ((value['repetitionFinalValues'] == "month" ||
                            value['repetitionFinalValues'] == "months")) {
                          if (value['repetitionFinalValues'] == "month") {
                            await monthCtrl.monthWeekDay(value);
                            calendarCtrl.focusedDay.value =
                                calendarCtrl.focusedDayDD.value;
                            calendarCtrl.update();
                            calendarCtrl.dateWiseData = calendarCtrl
                                .selectDate[calendarCtrl.focusedDay.value];
                            calendarCtrl.update();
                          } else {

                            await weeksCtrl.monthWeekDay(value);
                            calendarCtrl.focusedDay.value =
                                calendarCtrl.focusedDayDD.value;
                            calendarCtrl.update();
                            calendarCtrl.dateWiseData = calendarCtrl
                                .selectDate[calendarCtrl.focusedDay.value];
                            calendarCtrl.update();
                          }
                        }
                      }

                      calendarCtrl.focusedDay.value =
                          calendarCtrl.focusedDayDD.value;
                      calendarCtrl.update();

                      calendarCtrl.onDaySelected(calendarCtrl.focusedDay.value,
                          calendarCtrl.focusedDay.value);
                      calendarCtrl.isLoading = false;

                      calendarCtrl.update();
                    });
                  });
                });
          });
        });
      }),
    );
  }
}
