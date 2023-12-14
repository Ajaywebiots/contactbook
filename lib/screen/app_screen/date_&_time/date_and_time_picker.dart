import 'package:contactbook/config.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/rps_custom_painter.dart';
import 'package:contactbook/widgets/common_decrement_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:contactbook/extensions/spacing.dart';
import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/date_time_provider/date_time_provider.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime dateTime = DateTime.now();
  ScrollController hourController = ScrollController();
  ScrollController minuteController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(builder: (context1, dateTimePvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationsClass.ms150)
              .then((value) => dateTimePvr.onInit()),
          child: Container(
              alignment: Alignment.center,
              height: 800,
              decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.only(
                          topLeft: SmoothRadius(
                              cornerRadius: 10, cornerSmoothing: 1),
                          topRight: SmoothRadius(
                              cornerRadius: 10, cornerSmoothing: 1)))),
              child: SingleChildScrollView(
                  child: Column(children: [
                ListTile(
                    title: Text(textAssets.selectDate,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close))),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                          alignment: Alignment.center,
                          height: 34,
                          width: 34,
                          decoration: const BoxDecoration(
                              color: Color(0xffF5F6F7), shape: BoxShape.circle),
                          child: SvgPicture.asset(svgAssets.leftArrow))
                      .inkWell(context, onTap: () => dateTimePvr.onLeftArrow()),
                  const HSpace(20),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F6F7),
                          borderRadius: SmoothBorderRadius(
                              cornerRadius: 4, cornerSmoothing: 1)),
                      height: 34,
                      alignment: Alignment.center,
                      width: 129,
                      child: DropdownButton(
                          underline: Container(),
                          focusColor: Colors.white,
                          value: dateTimePvr.chosenValue,
                          style: const TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: appArray.monthList
                              .map<DropdownMenuItem>((monthValue) {
                            return DropdownMenuItem(
                                value: monthValue,
                                child: Text(monthValue['title'],
                                    style:
                                        const TextStyle(color: Colors.black)));
                          }).toList(),
                          icon: SvgPicture.asset(svgAssets.dropDown),
                          onChanged: (choseVal) =>
                              dateTimePvr.onDropDownChange(choseVal))),
                  const HSpace(20),
                  Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xffF5F6F7),
                              borderRadius: SmoothBorderRadius(
                                  cornerRadius: 4, cornerSmoothing: 1)),
                          height: 34,
                          width: 87,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${dateTimePvr.selectedYear.year}"),
                                SvgPicture.asset(svgAssets.dropDown)
                              ]))
                      .inkWell(context,
                          onTap: () => dateTimePvr.selectYear(context)),
                  const HSpace(20),
                  Container(
                          width: 34,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF5F6F7)),
                          child: SvgPicture.asset(svgAssets.rightArrow))
                      .inkWell(context, onTap: () => dateTimePvr.onRightArrow())
                ]),
                const VSpace(15),
                Container(
                    width: 350,
                    padding: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color: Color(0xffF5F6F7),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TableCalendar(
                        rowHeight: 60,
                        headerVisible: false,
                        daysOfWeekVisible: true,
                        pageJumpingEnabled: true,
                        pageAnimationEnabled: false,
                        lastDay: DateTime.utc(2030, 3, 14),
                        firstDay: DateTime.utc(2010, 10, 16),
                        onDaySelected: dateTimePvr.onDaySelected,
                        focusedDay: dateTimePvr.focusedDay.value,
                        availableGestures: AvailableGestures.none,
                        calendarFormat: dateTimePvr.calendarFormat,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        headerStyle: const HeaderStyle(
                            leftChevronVisible: false,
                            formatButtonVisible: false,
                            rightChevronVisible: false),
                        onPageChanged: (dayFocused) =>
                            dateTimePvr.onPageCtrl(dayFocused),
                        onCalendarCreated: (controller) =>
                            dateTimePvr.onCalendarCreate(controller),
                        selectedDayPredicate: (day) {
                          return isSameDay(dateTimePvr.focusedDay.value, day);
                        },
                        daysOfWeekStyle: DaysOfWeekStyle(
                            dowTextFormatter: (date, locale) =>
                                DateFormat.E(locale).format(date)[0],
                            weekdayStyle: TextStyle(
                                color: dateTimePvr.appColor.primaryColor,
                                fontWeight: FontWeight.bold),
                            weekendStyle: TextStyle(
                                color: dateTimePvr.appColor.primaryColor,
                                fontWeight: FontWeight.bold)),
                        calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                                color: dateTimePvr.appColor.primaryColor,
                                shape: BoxShape.circle)))),
                ListTile(
                    leading: Text(textAssets.time,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                // Positioned(
                //   child: TimePickerSpinner(
                //       spacing: 50,
                //       itemHeight: 80,
                //       is24HourMode: false,
                //       isForce2Digits: false,
                //       normalTextStyle: const TextStyle(
                //           fontSize: 24, color: Colors.transparent),
                //       highlightedTextStyle:
                //           const TextStyle(fontSize: 24, color: Colors.yellow),
                //       onTimeChange: (time) {
                //         setState(() {
                //           dateTime = time;
                //         });
                //       }),
                // ),
                Stack(alignment: Alignment.center, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomPaint(
                      painter: RPSCustomPainter(),
                      child: const SizedBox(height: 100, width: 100),
                    ),

                    // CustomTimePicker(
                    //     title: "Hour",
                    //     itemList: appArray.hourList,
                    //     onIncrement: () => dateTimePvr.onHourIncrement(),
                    //     onDecrement: () => dateTimePvr.onHourDecrement(),
                    //     carouselController: dateTimePvr.carouselController,
                    //     onScroll: (index) => dateTimePvr.onHourScroll(index)),
                    const SizedBox(width: 10),
                    SvgPicture.asset(svgAssets.colonIcon),
                    const SizedBox(width: 10),
                    // CustomTimePicker(
                    //     title: "Minute",
                    //     itemList: appArray.minList,
                    //     onIncrement: () => dateTimePvr.onMinIncrement(),
                    //     onDecrement: () => dateTimePvr.onMinDecrement(),
                    //     onScroll: (index) => dateTimePvr.onMinScroll(index),
                    //     carouselController: dateTimePvr.carouselController1),
                    CustomPaint(
                      painter: RPSCustomPainter(),
                      child: const SizedBox(height: 100, width: 100),
                    ),
                    const SizedBox(width: 20),
                    // CustomTimePicker(
                    //     title: "Day",
                    //
                    //     onIncrement: () => dateTimePvr.onDayIncrement(),
                    //     onDecrement: () => dateTimePvr.onDayDecrement(),
                    //     onScroll: (index) => dateTimePvr.onDayScroll(index),
                    //     carouselController: dateTimePvr.carouselController2),
                    CustomPaint(
                      painter: RPSCustomPainter(),
                      child: const SizedBox(height: 100, width: 100),
                    ),
                  ]),
                  //     onHourDecrement() {
                  // setState(() {
                  // // Decrease the hour by 1
                  // dateTime = dateTime.subtract(Duration(hours: 1));
                  // });
                  // }

                  //         onHourIncrement() {
                  // setState(() {
                  // // Increase the hour by 1
                  // dateTime = dateTime.add(Duration(hours: 1));
                  // });
                  // }
                  // TimePickerSpinner(
                  //   hourController: hourController,
                  //
                  //     onIncrement: () {
                  //       dateTime = dateTime.add(const Duration(hours: 1));
                  //       log("datetime onIncrement : : $dateTime");
                  //
                  //
                  //       if(hourController != null) {
                  //         hourController.jumpTo(value);
                  //         log("datetime hourController : : $hourController");
                  //       }
                  //       setState(() {});
                  //     },
                  //     onDecrement: () {
                  //
                  //       setState(() {
                  //         dateTime = dateTime.subtract(const Duration(hours: 1));
                  //         log("datetime onDecrement : : $dateTime");
                  //
                  //         if(hourController != null) {
                  //           hourController.jumpTo(dateTime.hour.toDouble());
                  //           log("datetime hourController : : ${hourController}");
                  //         }
                  //       });
                  //     },
                  //     itemHeight: 25,
                  //     alignment: Alignment.center,
                  //     is24HourMode: false,
                  //     isForce2Digits: true,
                  //     normalTextStyle: const TextStyle(
                  //         fontSize: 01, color: Colors.transparent),
                  //     highlightedTextStyle: TextStyle(
                  //         fontSize: 22,
                  //         color: dateTimePvr.appColor.primaryColor),
                  //     onTimeChange: (time) {
                  //       setState(() {
                  //         dateTime = time;
                  //       });
                  //     }),
                 /*Positioned(
                    left: 0,
                    child: CommonDecrementInkWell(
                        onTap: () {}, assetPath: svgAssets.decrement),
                  ),
                  CommonDecrementInkWell(
                      onTap: () {}, assetPath: svgAssets.decrement),
                  CommonDecrementInkWell(
                      onTap: () {}, assetPath: svgAssets.decrement),*/
                ]),
                InkWell(
                    onTap: () => dateTimePvr.onAddDateTimeButton(),
                    child: Container(
                        height: 50,
                        width: 345,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            color: dateTimePvr.appColor.primaryColor,
                            borderRadius: SmoothBorderRadius(
                                cornerRadius: 8, cornerSmoothing: 1)),
                        child: Text(textAssets.addDate,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                const VSpace(6)
              ]))));
    });
  }
}
