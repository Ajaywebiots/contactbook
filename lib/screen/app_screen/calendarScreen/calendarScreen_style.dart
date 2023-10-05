// ignore_for_file: prefer_function_declarations_over_variables, duplicate_ignore

import 'package:contactbook/screen/app_screen/calendarScreen/add_Exercise_button.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/app_screem_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/theme/app_color.dart';


// ignore: duplicate_ignore
class CalendarScreenStyle {
  // Spacing Height
  final spacing = (data) => SizedBox(
        height: data,
      );

  // Spacing Width
  final spacingWidth = (data) => SizedBox(
        width: data,
      );

  //container box decoration for completed exercise and training
  final boxDecoration = (
          {List<BoxShadow>? boxShadow,
          double borderRadius = 0,
          Color? color,
          Color? borderColor}) =>
      BoxDecoration(
          boxShadow: boxShadow,
          color: color,
          border: Border.all(color: borderColor!, width: 1.5),
          borderRadius: BorderRadius.circular(
              borderRadius));

  // Common Text
  final commonTextStyle = (
          {double? fontSize,
          FontWeight? fontWeight,
          Color? color,
          double? letterSpacing}) =>
      TextStyle(
          fontSize: fontSize!,
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: color);

  //event deatil container style
  final eventDetailScreenStyle =
      ({Widget? child, BuildContext? context}) => Container(
            width: MediaQuery.of(context!).size.width,
            height: MediaQuery.of(context).size.height / 2.8,

            decoration: BoxDecoration(
                color: AppColor().whiteColor,
                borderRadius:
                    BorderRadius.circular(30)),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {

                overscroll.disallowIndicator();
                return false;
              },
              child: child!,
            ),
          );

  //common card layout
  final commonCardLayout = ({Widget? child}) => Padding(
    padding: const EdgeInsets.only(
        right: 17,
        left: 17,
        top: 20),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    ),
  );

  //home background layout
  final homeBGLayout = (context) => Image.asset("assets/images/userSlider.png");

  //home Body Layout
  // ignore: prefer_function_declarations_over_variables
  final homeBodyLayout = ({Widget? child}) => Container(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: child);

  //add exercise button
  final addExerciseButtonStyle = ({GestureTapCallback? onTap}) => AddExerciseButton(onTap: onTap,);
}
