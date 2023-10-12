import 'dart:developer';
import 'package:contactbook/provider/date_time_provider/date_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearAlertDialog extends StatelessWidget {
  const YearAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(builder: (context, dateTimePvr, child) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
            title: const Text("Select Year"),
            content: SizedBox(
                width: 300,
                height: 300,
                child: Theme(
                    data: ThemeData(
                        useMaterial3: true,
                        colorScheme: const ColorScheme.light(
                            primary: Color(0xff5465FF),
                            onSurface: Colors.black)),
                    child: YearPicker(
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 1)),
                        lastDate: DateTime(2040),
                        selectedDate: dateTimePvr.selectedYear,
                        onChanged: (DateTime dateTime) {
                          dateTimePvr.selectedYear = dateTime;
                          dateTimePvr.showYear = "${dateTime.year}";
                          dateTimePvr.focusedDay.value = DateTime.utc(
                              dateTimePvr.selectedYear.year,
                              dateTimePvr.chosenValue['index'],
                              dateTimePvr.focusedDay.value.day + 0);
                          dateTimePvr.onDaySelected(
                              dateTimePvr.focusedDay.value,
                              dateTimePvr.focusedDay.value);
                          Navigator.pop(context);
                          log("YEAR CHANGE : ${dateTimePvr.focusedDay.value}");
                        }))));
      });
    });
  }
}
