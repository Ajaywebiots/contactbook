import 'package:contactbook/screen/app_screen/calendarScreen/detail_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../date_&_time/layouts/app_screem_util.dart';
class Timeline2 extends StatefulWidget {
  var data;
  String? userName;
  GestureTapCallback? onTap;
  List? dataList;
  DateTime? date;
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onChanged2;
  final String? deleteOption;

  Timeline2(
      {this.data,
      this.userName,
      this.onTap,
      this.dataList,
      this.date,
      this.onChanged,
      this.onChanged2,
      this.deleteOption});

  @override
  State<Timeline2> createState() => _Timeline2State();
}

class _Timeline2State extends State<Timeline2> {
  @override
  Widget build(BuildContext context) {
    return widget.data != null && widget.data != ""
        ? Container(
            padding: EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height / 2.7,
            child: ListView.builder(
              // shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 10 : 0),
                  child: DetailList(
                    index: index,
                    lastIndex: widget.data.length - 1,
                    data: widget.data[index],
                    onTap: () {
                      widget.data[index]['date'] = widget.date.toString();
                      if (widget.data[index]['status'] == 'Exercise Done') {
                        Map<String, dynamic> data;
                        for (var i = 0; i < widget.dataList!.length; i++) {
                          if (widget.data[index]['id'] ==
                              widget.dataList![i]['id']) {
                            data = {
                              'id': widget.data[index]['id'],
                              'name': widget.data[index]['title'],
                              'value': widget.data[index]
                            };
                          }
                        }

                      } else if (widget.data[index]['status'] ==
                          'Exercise Skipped') {
                        Map<String, dynamic> data;

                        for (var i = 0; i < widget.dataList!.length; i++) {
                          if (widget.data[index]['id'] ==
                              widget.dataList![i]['id']) {
                            data = {
                              'id': widget.data[index]['id'],
                              'name': widget.data[index]['title'],
                              'value': widget.data[index]
                            };
                          }
                        }

                      } else if (widget.data[index]['status'] ==
                          'Exercise In Progress') {
                        Map<String, dynamic> data;

                        for (var i = 0; i < widget.dataList!.length; i++) {
                          if (widget.data[index]['id'] ==
                              widget.dataList![i]['id']) {
                            data = {
                              'id': widget.data[index]['id'],
                              'name': widget.data[index]['title'],
                              'value': widget.data[index]
                            };
                          }
                        }


                      } else if (widget.data[index]['status'] ==
                          'Exercise Not Started') {

                        for (var i = 0; i < widget.dataList!.length; i++) {
                          if (widget.data[index]['id'] ==
                              widget.dataList![i]['id']) {
                          }
                        }

                      }
                    },
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
