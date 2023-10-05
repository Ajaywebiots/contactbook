import 'package:flutter/material.dart';


class CalendarLoading extends StatelessWidget {
  const CalendarLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
      color: Colors.white.withOpacity(0.6),
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Column(children: <Widget>[
                CircularProgressIndicator()
              ]))
        ],
      ),
    );
  }
}
