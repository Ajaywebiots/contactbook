import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contactbook/common/theme/app_color.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/provider/date_time_provider/layouts/year_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateTimeProvider extends ChangeNotifier {
  int demoInt = 0;
  dynamic chosenValue;
  DateTime? selectedDay;
  int selectedIndex = 0;
  int scrollDayIndex = 0;
  int scrollMinIndex = 0;
  int scrollHourIndex = 0;
  String showYear = 'Select Year';
  final AppColor appColor = AppColor();
  DateTime selectedYear = DateTime.now();
  PageController pageController = PageController();
  CalendarFormat calendarFormat = CalendarFormat.month;
  CarouselController carouselController = CarouselController();
  CarouselController carouselController1 = CarouselController();
  CarouselController carouselController2 = CarouselController();
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());

  void onDaySelected(DateTime selectDay, DateTime fDay) {
    notifyListeners();
    focusedDay.value = selectDay;
  }

  onInit() {
    focusedDay.value = DateTime.utc(focusedDay.value.year,
        focusedDay.value.month, focusedDay.value.day + 0);
    onDaySelected(focusedDay.value, focusedDay.value);
    DateTime dateTime = DateTime.now();
    int index = appArray.monthList
        .indexWhere((element) => element['index'] == dateTime.month);
    chosenValue = appArray.monthList[index];
    log("index : $chosenValue");
    log("selectedYear : ${selectedYear.minute}");
    notifyListeners();
  }
  //
  // onHourDecrement() {
  //   setState(() {
  //     // Decrease the hour by 1
  //     dateTime = dateTime.subtract(Duration(hours: 1));
  //   });
  // }
  //
  // onHourIncrement() {
  //   setState(() {
  //     // Increase the hour by 1
  //     dateTime = dateTime.add(Duration(hours: 1));
  //   });
  // }
  // onHourDecrement() {
  //   if (scrollHourIndex > 0) {
  //     scrollHourIndex--;
  //   }
  //   carouselController.jumpToPage(scrollHourIndex);
  //   notifyListeners();
  // }
  //
  // onHourIncrement() {
  //   if (scrollHourIndex < appArray.hourList.length - 1) {
  //     scrollHourIndex++;
  //   }
  //   carouselController.jumpToPage(scrollHourIndex);
  //   notifyListeners();
  // }

  onMinDecrement() {
    if (scrollMinIndex > 0) {
      scrollMinIndex--;
    }
    carouselController1.jumpToPage(scrollMinIndex);
    notifyListeners();
  }

  onMinIncrement() {
    if (scrollMinIndex < appArray.minList.length - 1) {
      scrollMinIndex++;
    }
    notifyListeners();
    carouselController1.jumpToPage(scrollMinIndex);
    notifyListeners();
  }

  onDayDecrement() {
    if (scrollDayIndex > 0) {
      scrollDayIndex--;
    }
    notifyListeners();
    carouselController2.jumpToPage(scrollDayIndex);
    notifyListeners();
  }

  onDayIncrement() {
    if (scrollDayIndex < appArray.dayList.length) {
      scrollDayIndex++;
    }
    notifyListeners();
    carouselController2.jumpToPage(scrollDayIndex);
    notifyListeners();
  }

  onAddDateTimeButton() {}

  onDropDownChange(choseVal) {
    notifyListeners();
    chosenValue = choseVal;

    notifyListeners();
    int index = choseVal['index'];
    log("chosenValue : $index");
    focusedDay.value =
        DateTime.utc(focusedDay.value.year, index, focusedDay.value.day + 0);
    onDaySelected(focusedDay.value, focusedDay.value);
    log("choseVal : $choseVal");
  }

  onPageCtrl(dayFocused) {
    focusedDay.value = dayFocused;
    demoInt = dayFocused.year;
    log("dayFocused :: $demoInt");
    notifyListeners();
  }

  onHourScroll(index) {
    scrollHourIndex = index;
    notifyListeners();
  }

  onMinScroll(index) {
    scrollMinIndex = index;
    notifyListeners();
  }

  onDayScroll(index) {
    scrollDayIndex = index;
    notifyListeners();
  }

  onCalendarCreate(controller) {
    log("controller : $controller");
    pageController = controller;
  }

  selectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context3) {
          return const YearAlertDialog();
        });
  }

  onLeftArrow() {
    pageController.previousPage(
        duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
    log("FFF : $focusedDay");
  }

  onRightArrow() {
    pageController.nextPage(
        duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
    final newMonth = focusedDay.value.add(const Duration(days: 30));
    log("hbfbfdbf::::::$newMonth");
  }
}
