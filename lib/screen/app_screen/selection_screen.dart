import 'package:contactbook/provider/selection_provider.dart';
import 'package:contactbook/screen/app_screen/date_&_time/date_and_time_picker.dart';
import 'package:contactbook/screen/app_screen/filter_screen/popup_list_and_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionScreen extends StatefulWidget {
  final SharedPreferences? prefs;

  const SelectionScreen({super.key, this.prefs});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectionProvider>(builder: (context, value, child) {
      double height = value.heightMQ(context);
      double width = value.widthMQ(context);
      return Scaffold(
          body: GridView.builder(
              itemCount: value.screen.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (index == 5) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return const PopUpList();
                              });
                            });
                      } else if (index == 6) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return const DateTimePicker();
                              });
                            });
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return value.screen[index];
                        }));
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        height: height * 0.1,
                        width: width * 1,
                        alignment: Alignment.center,
                        child: Text(value.screenName[index],
                            style: const TextStyle(color: Colors.white))));
              }));
    });
  }
}
