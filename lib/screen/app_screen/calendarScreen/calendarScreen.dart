import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/event_detail_layout.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/loading_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:contactbook/common/theme/app_color.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/calendar_common.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/month_year_layouts.dart';
import 'add_exercise_layout.dart';
import 'calendar_view.dart';
import 'commonAppBar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var calendarCtrl = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    //month and year text layout
    const monthAndYearTextLayout = MonthYearTextLayout();

    // // appbar layout
    final appBarLayout = CommonAppBar(
        onTap: () => Get.back(), text: "exercisePlan", isShow: true);

    //calendar layout
    const calendarLayout = CalendarView();

    //event details
    const eventDetailsLayout = EventDetailLayout();

    //add exercise layout
    final addExerciseLayout = GetBuilder<CalendarController>(
        builder: (_) => const AddExerciseLayout());

    //main body layout
    return GetBuilder<CalendarController>(
        builder: (_) => Scaffold(
              backgroundColor: AppColor().primarlightColor,
              floatingActionButton: calendarCtrl.userName == "userName2"
                  ? addExerciseLayout
                  : Container(),
              body: Stack(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: CalendarCommonScreen().body(
                        context,
                        appBarLayout,
                        monthAndYearTextLayout,
                        calendarLayout,
                        eventDetailsLayout,
                        calendarCtrl.userName)),
                if (calendarCtrl.isLoading) const CalendarLoading()
              ]),
            ));
  }
}
