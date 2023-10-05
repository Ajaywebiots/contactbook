import 'package:contactbook/screen/app_screen/calendarScreen/delete_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:contactbook/common/theme/app_color.dart';
import 'calendar_controller.dart';

class DeleteDialog extends StatelessWidget {
  final int? index;
  final String? exerciseName;
  final String? status;
  final DateTime? focusDate;
  final BuildContext? buildContext;

  const DeleteDialog(
      {Key? key, this.index, this.exerciseName, this.status, this.focusDate,this.buildContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (calendarCtrl) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        title: const Text(
          "deleteRecurringExercisePlan",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        actionsPadding: const EdgeInsets.only(bottom: 10),
        content: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  calendarCtrl.deleteOption = "today";
                  calendarCtrl.update();
                },
                child: ListTile(
                    title: const Text(
                      "today",
                      style: TextStyle(fontSize:14),
                    ),
                    leading: Radio(
                        value: "today",
                        groupValue: calendarCtrl.deleteOption,
                        onChanged: (val) {
                          calendarCtrl.deleteOption = val.toString();
                          calendarCtrl.update();
                        })),
              ),
              InkWell(
                onTap: () {
                  calendarCtrl.deleteOption = "followingExercisePlan";
                  calendarCtrl.update();
                },
                child: ListTile(
                  title: const Text("deleteRecurringExercisePlan",
                      style: TextStyle(fontSize: 14)),
                  leading: Radio(
                      value: "followingExercisePlan",
                      groupValue: calendarCtrl.deleteOption,
                      onChanged: (val) {
                        calendarCtrl.deleteOption = val.toString();
                        calendarCtrl.update();
                      }),
                ),
              )
            ],
          ),
        ),
        actions: [
          DeleteActionButton(onTap: () => Get.back(),text: "close",),
          DeleteActionButton(onTap: () {
            if(calendarCtrl.deleteOption != "") {
              calendarCtrl.deleteCtrl.focusedDay.value =
                  calendarCtrl.deleteCtrl.currentDate.value;
              calendarCtrl.deleteCtrl.update();
              calendarCtrl.deleteCtrl.deletePlan(
                  calendarCtrl.deleteOption, index, exerciseName, status,
                  focusDate: focusDate);
              calendarCtrl.deleteOption = "";
              calendarCtrl.update();
              Get.back();
            }else{
              ScaffoldMessenger.of(buildContext!)
                  .showSnackBar(SnackBar(
                content: const Text('Please Select any one delete option'),
                duration: const Duration(seconds: 1),

                backgroundColor: AppColor().blackColor,
                behavior: SnackBarBehavior.floating,
              ));
           //   Get.snackbar(AppFont().alert, "Select one delete option",backgroundColor: appColor.p);
            }
          },text: "delete"),

        ],
      );
    });
  }
}
