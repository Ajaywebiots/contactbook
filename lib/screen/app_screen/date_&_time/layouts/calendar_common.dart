import 'package:contactbook/screen/app_screen/date_&_time/layouts/app_screem_util.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/callendar_style.dart';
import 'package:flutter/material.dart';

class CalendarCommonScreen {
  // common Text Layout
  // ignore: prefer_function_declarations_over_variables
  final commonText = (text,
          {double? fontSize,
          TextAlign? textAlign,
          Color? color,
          var overflow,
          FontWeight? fontWeight,
          double? letterSpacing}) =>
      Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        style: CalendarScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      );

  //common decoration
  // ignore: prefer_function_declarations_over_variables
  final decoration =
      (color) => BoxDecoration(color: color, shape: BoxShape.circle);

  //common calendar text style
  // ignore: prefer_function_declarations_over_variables
  final commonCalendarTextStyle = (color) =>
      TextStyle(color: color, fontSize: 12);

  //main body layout
  // ignore: prefer_function_declarations_over_variables
  final body = (BuildContext context, appBarLayout, monthAndYearTextLayout,
          calendarLayout, eventDetailsLayout, userName) =>
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SingleChildScrollView(
                    child: Stack(children: [
                  CalendarScreenStyle().homeBGLayout(context),
                  CalendarScreenStyle().homeBodyLayout(
                      child: Column(children: [
                    appBarLayout,
                    CalendarScreenStyle().commonCardLayout(
                        child: Column(
                      children: [monthAndYearTextLayout, calendarLayout],
                    )),
                    CalendarScreenStyle()
                        .commonCardLayout(child: eventDetailsLayout)
                  ]))
                ]))
              ],
            ),
          ],
        ),
      );
}
