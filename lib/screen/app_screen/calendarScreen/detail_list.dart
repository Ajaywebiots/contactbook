import 'package:contactbook/common/theme/app_color.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendarCommonScreen.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendarScreen_style.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/calendar_controller.dart';
import 'package:contactbook/screen/app_screen/calendarScreen/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DetailList extends StatelessWidget {
  final dynamic data;
  final int? index;
  final int? lastIndex;
  final GestureTapCallback? onTap;
  final String? deleteOption;
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onChanged2;

  const DetailList(
      {Key? key,
      this.data,
      this.onTap,
      this.index,
      this.lastIndex,
      this.deleteOption,
      this.onChanged,
      this.onChanged2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (calendarCtrl) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5),
            child: InkWell(
              onTap: () {
                if (data['status'] == 'Exercise Not Started') {
                  Get.dialog(
                    DeleteDialog(
                      index: index,
                      exerciseName: data['title'],
                      status: data['status'],
                      focusDate: calendarCtrl.focusedDay.value,
                      buildContext: context,
                    ),
                  ).then((value) {
                    calendarCtrl.getData();
                    calendarCtrl.update();
                  });
                }
              },
              child: Container(
                color: AppColor().whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          data['status'] == 'Exercise Not Started'
                              ? "assets/images/userSlider.png"
                              : data['status'] == 'Exercise Done'
                                  ? "assets/images/userSlider.png"
                                  : "assets/images/userSlider.png",
                          height: 25,
                        ),
                        CalendarScreenStyle().spacingWidth(12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CalendarCommonScreen().commonText(data['title'],
                                  fontSize: 12, fontWeight: FontWeight.w700),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    CalendarCommonScreen().commonText(
                                        data['sets'] + ' sets',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor().gray.withOpacity(.7)),
                                    VerticalDivider(
                                      color: AppColor().gray,
                                    ),
                                    CalendarCommonScreen().commonText(
                                        '${data['repetitionValue'].toString()} Repetition',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor().gray.withOpacity(.7)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    CalendarScreenStyle().spacingWidth(5),
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: data['status'] == 'Exercise Not Started'
                                  ? [
                                      AppColor().notStartedColor1,
                                      AppColor().notStartedColor2,
                                      AppColor().notStartedColor3,
                                      AppColor().notStartedColor4,
                                    ]
                                  : data['status'] == 'Exercise In Progress' ||
                                          data['status'] == 'Exercise Skipped'
                                      ? [
                                          AppColor().inProgressColor1,
                                          AppColor().inProgressColor2,
                                          AppColor().inProgressColor3,
                                          AppColor().inProgressColor4,
                                        ]
                                      : [
                                          AppColor().completedColor1,
                                          AppColor().completedColor2,
                                          AppColor().completedColor3,
                                          AppColor().completedColor4,
                                        ],
                            ),
                            color: AppColor().secondaryColor,
                            borderRadius: BorderRadius.circular(
                                8)),
                        child: CalendarCommonScreen().commonText(data['status'],
                            fontSize: 9, color: AppColor().whiteColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (index != lastIndex)
            Divider(
              height: 5,
              color: AppColor().gray,
            )
        ],
      );
    });
  }
}
