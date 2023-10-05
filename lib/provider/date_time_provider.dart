import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class DateTimeProvider extends ChangeNotifier {
  selectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Select Year"),
              content: SizedBox(
                  width: 300,
                  height: 300,
                  child: YearPicker(
                      initialDate: DateTime.now(),
                      firstDate:
                      DateTime.now().subtract(const Duration(days: 1)),
                      lastDate: DateTime(2040),
                      selectedDate: selectedYear,
                      onChanged: (DateTime dateTime) {
                       notifyListeners();
                          selectedYear = dateTime;
                          showYear = "${dateTime.year}";

                        Navigator.pop(context);
                      })));
        });
  }



  List monthList = [
    {"title": "January", "index": 1},
    {"title": "February", "index": 2},
    {"title": "March", "index": 3},
    {"title": "April", "index": 4},
    {"title": "May", "index": 5},
    {"title": "June", "index": 6},
    {"title": "July", "index": 7},
    {"title": "August", "index": 8},
    {"title": "September", "index": 9},
    {"title": "October", "index": 10},
    {"title": "November", "index": 11},
    {"title": "December", "index": 12},
  ];
  List<String> day = ["A.M.", "P.M."];
  List<String> hour = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  List<String> min = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59"
  ];

  dynamic chosenValue;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;
  DateTime? focusedCurrentDay = DateTime.now();
  PageController pageController = PageController();
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  CarouselController carouselController = CarouselController();
  CarouselController carouselController1 = CarouselController();
  CarouselController carouselController2 = CarouselController();

  //on day select tap
  void onDaySelected(DateTime selectDay, DateTime fDay) {
    notifyListeners();
    focusedDay.value = selectDay;

  }

  onInit(){
    focusedDay.value = DateTime.utc(focusedDay.value.year,
        focusedDay.value.month, focusedDay.value.day + 0);
    onDaySelected(focusedDay.value, focusedDay.value);
    DateTime dateTime = DateTime.now();
    int index =
    monthList.indexWhere((element) => element['index'] == dateTime.month);
    log("index : $index");
    notifyListeners();
    chosenValue = monthList[index];
  }

  String showYear = 'Select Year';
  DateTime selectedYear = DateTime.now();

  int scrollHourIndex = 0;
  int scrollMinIndex = 0;
  int scrollDayIndex = 0;
  int demoInt = 0;



}

