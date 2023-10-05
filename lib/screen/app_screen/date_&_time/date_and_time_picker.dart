import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/rps_custom_painter.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:contactbook/extensions/spacing.dart';

import '../../../provider/date_time_provider.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(builder: (context, dateTimePdr, child) {
      return Container(
          alignment: Alignment.center,
          height: 800,
          decoration: const ShapeDecoration(
              color: Colors.white,
              shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.only(
                      topLeft:
                          SmoothRadius(cornerRadius: 10, cornerSmoothing: 1),
                      topRight:
                          SmoothRadius(cornerRadius: 10, cornerSmoothing: 1)))),
          child: SingleChildScrollView(
              child: Column(children: [
            ListTile(
                title: const Text("Select date & time",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close))),
            const ListTile(title: Text("6 Sep 2023, 6:10 am")),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                  alignment: Alignment.center,
                  height: 34,
                  width: 34,
                  decoration: const BoxDecoration(
                      color: Color(0xffF5F6F7), shape: BoxShape.circle),
                  child: SvgPicture.asset("assets/svg/leftArrow.svg")),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F6F7),
                      borderRadius: SmoothBorderRadius(
                          cornerRadius: 4, cornerSmoothing: 1)),
                  alignment: Alignment.center,
                  height: 34,
                  width: 129,
                  // child: Text("$chosenValue"),
                  child: DropdownButton(
                      underline: Container(),
                      focusColor: Colors.white,
                      value: dateTimePdr.chosenValue,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: dateTimePdr.monthList
                          .map<DropdownMenuItem>((monthValue) {
                        return DropdownMenuItem(
                            value: monthValue,
                            child: Text(monthValue['title'],
                                style: const TextStyle(color: Colors.black)));
                      }).toList(),
                      icon: SvgPicture.asset("assets/svg/dropDown.svg"),
                      onChanged: (choseVal) {
                        setState(() {
                          dateTimePdr.chosenValue = choseVal;
                          int index = choseVal['index'];
                          log("chosenValue : $index");
                          dateTimePdr.focusedDay.value = DateTime.utc(
                              dateTimePdr.focusedDay.value.year,
                              index,
                              dateTimePdr.focusedDay.value.day + 0);
                          dateTimePdr.onDaySelected(
                              dateTimePdr.focusedDay.value,
                              dateTimePdr.focusedDay.value);
                        });
                        log("choseVal : $choseVal");
                      })),
              InkWell(
                onTap: () => dateTimePdr.selectYear(context),
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F6F7),
                        borderRadius: SmoothBorderRadius(
                            cornerRadius: 4, cornerSmoothing: 1)),
                    height: 34,
                    width: 87,
                    child: Text(dateTimePdr.showYear)),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 34,
                  width: 34,
                  decoration: const BoxDecoration(
                      color: Color(0xffF5F6F7), shape: BoxShape.circle),
                  child: SvgPicture.asset("assets/svg/rightArrow.svg"))
            ]),
            const VSpace(15),
            Container(
                padding: const EdgeInsets.only(top: 20),
                width: 350,
                decoration: const BoxDecoration(
                    color: Color(0xffF5F6F7),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: TableCalendar(
                    pageJumpingEnabled: true,
                    onPageChanged: (dayFocused) {
                      dateTimePdr.focusedDay.value = dayFocused;
                      dateTimePdr.demoInt = dayFocused.year;
                      log("dayFocused :: $dateTimePdr.demoInt");
                      setState(() {});
                    },
                    onCalendarCreated: (controller) {
                      log("controller : $controller");
                      dateTimePdr.pageController = controller;
                    },
                    headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        leftChevronIcon:
                            SvgPicture.asset("assets/svg/leftArrow.svg"),
                        rightChevronIcon:
                            SvgPicture.asset("assets/svg/rightArrow.svg")),
                    selectedDayPredicate: (day) {
                      return isSameDay(dateTimePdr.focusedDay.value, day);
                    },
                    onDaySelected: dateTimePdr.onDaySelected,
                    headerVisible: true,
                    availableGestures: AvailableGestures.none,
                    pageAnimationEnabled: false,
                    onHeaderLongPressed: (bll) {
                      log("NNN : $bll");
                    },
                    daysOfWeekVisible: true,
                    daysOfWeekStyle: DaysOfWeekStyle(
                        dowTextFormatter: (date, locale) =>
                            DateFormat.E(locale).format(date)[0],
                        weekdayStyle: const TextStyle(
                            color: Color(0xff5465FF),
                            fontWeight: FontWeight.bold),
                        weekendStyle: const TextStyle(
                            color: Color(0xff5465FF),
                            fontWeight: FontWeight.bold)),
                    calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: Color(0xff5465FF), shape: BoxShape.circle)),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    rowHeight: 60,
                    calendarFormat: dateTimePdr.calendarFormat,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: dateTimePdr.focusedDay.value)),
            const ListTile(
                leading: Text("Time",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomPaint(
                  painter: RPSCustomPainter(),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const VSpace(6),
                            InkWell(
                                onTap: () {
                                  if (dateTimePdr.scrollHourIndex > 0) {
                                    dateTimePdr.scrollHourIndex--;
                                  }
                                  dateTimePdr.carouselController
                                      .jumpToPage(dateTimePdr.scrollHourIndex);
                                  setState(() {});
                                },
                                child: SizedBox(
                                    height: 23,
                                    width: 80,
                                    child: SvgPicture.asset(
                                        "assets/svg/decrement.svg"))),
                            const VSpace(6),
                            Expanded(
                                child: CarouselSlider.builder(
                                    carouselController:
                                        dateTimePdr.carouselController,
                                    itemCount: dateTimePdr.hour.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return Text(
                                          textAlign: TextAlign.center,
                                          dateTimePdr.hour[index],
                                          style: const TextStyle(
                                              color: Color(0xff5465FF),
                                              fontSize: 22));
                                    },
                                    options: CarouselOptions(
                                        onPageChanged: (index, reason) {
                                          dateTimePdr.scrollHourIndex = index;
                                          setState(() {});
                                        },
                                        autoPlay: false,
                                        scrollDirection: Axis.vertical))),
                            const VSpace(6),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (dateTimePdr.scrollHourIndex <
                                        dateTimePdr.hour.length - 1) {
                                      dateTimePdr.scrollHourIndex++;
                                    }
                                    dateTimePdr.carouselController.jumpToPage(
                                        dateTimePdr.scrollHourIndex);
                                  });
                                },
                                child: SizedBox(
                                    height: 23,
                                    width: 80,
                                    child: SvgPicture.asset(
                                        "assets/svg/increment.svg"))),
                            const VSpace(6)
                          ]))),
              const SizedBox(width: 10),
              SvgPicture.asset("assets/svg/midIcon.svg"),
              const SizedBox(width: 10),
              CustomPaint(
                  painter: RPSCustomPainter(),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(children: [
                        const VSpace(6),
                        InkWell(
                            onTap: () {
                              if (dateTimePdr.scrollMinIndex > 0) {
                                dateTimePdr.scrollMinIndex--;
                              }
                              dateTimePdr.carouselController1
                                  .jumpToPage(dateTimePdr.scrollMinIndex);
                              setState(() {});
                            },
                            child: SizedBox(
                                height: 23,
                                width: 80,
                                child: SvgPicture.asset(
                                    "assets/svg/decrement.svg"))),
                        const VSpace(6),
                        Expanded(
                            child: CarouselSlider.builder(
                                carouselController:
                                    dateTimePdr.carouselController1,
                                itemCount: dateTimePdr.min.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Text(
                                      textAlign: TextAlign.center,
                                      dateTimePdr.min[index],
                                      style: const TextStyle(
                                          color: Color(0xff5465FF),
                                          fontSize: 22));
                                },
                                options: CarouselOptions(
                                    autoPlay: false,
                                    scrollDirection: Axis.vertical))),
                        const VSpace(6),
                        InkWell(
                            onTap: () {
                              if (dateTimePdr.scrollMinIndex <
                                  dateTimePdr.min.length - 1) {
                                dateTimePdr.scrollMinIndex++;
                              }
                              dateTimePdr.carouselController1
                                  .jumpToPage(dateTimePdr.scrollMinIndex);
                              setState(() {});
                            },
                            child: SizedBox(
                                height: 23,
                                width: 80,
                                child: SvgPicture.asset(
                                    "assets/svg/increment.svg"))),
                        const VSpace(6)
                      ]))),
              const SizedBox(width: 20),
              CustomPaint(
                  painter: RPSCustomPainter(),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const VSpace(6),
                            InkWell(
                                onTap: () {
                                  if (dateTimePdr.scrollDayIndex > 0) {
                                    dateTimePdr.scrollDayIndex--;
                                  }
                                  dateTimePdr.carouselController2
                                      .jumpToPage(dateTimePdr.scrollDayIndex);
                                  setState(() {});
                                },
                                child: SizedBox(
                                    height: 23,
                                    width: 80,
                                    child: SvgPicture.asset(
                                        "assets/svg/decrement.svg"))),
                            Expanded(
                                child: CarouselSlider.builder(
                                    carouselController:
                                        dateTimePdr.carouselController2,
                                    itemCount: dateTimePdr.day.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return Text(
                                              textAlign: TextAlign.center,
                                              dateTimePdr.day[index],
                                              style: const TextStyle(
                                                  color: Color(0xff5465FF),
                                                  fontSize: 22))
                                          .paddingOnly(left: 6);
                                    },
                                    options: CarouselOptions(
                                        autoPlay: false,
                                        scrollDirection: Axis.vertical,
                                        onPageChanged: (index, reason) {
                                          dateTimePdr.scrollDayIndex = index;
                                          setState(() {});
                                        }))),
                            InkWell(
                                onTap: () {
                                  if (dateTimePdr.scrollDayIndex <
                                      dateTimePdr.day.length) {
                                    dateTimePdr.scrollDayIndex++;
                                  }
                                  dateTimePdr.carouselController2
                                      .jumpToPage(dateTimePdr.scrollDayIndex);
                                  setState(() {});
                                },
                                child: SizedBox(
                                    height: 23,
                                    width: 80,
                                    child: SvgPicture.asset(
                                        "assets/svg/increment.svg"))),
                            const VSpace(6)
                          ])))
            ]),
            InkWell(
                onTap: () {},
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    width: 335,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff5465FF),
                        borderRadius: SmoothBorderRadius(
                            cornerRadius: 8, cornerSmoothing: 1)),
                    child: const Text("Add date & time",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)))),
            const VSpace(6),
          ])));
    });
  }
}
