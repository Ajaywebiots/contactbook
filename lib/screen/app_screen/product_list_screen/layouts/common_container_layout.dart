import 'package:contactbook/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String text;
  const CommonContainer({super.key,this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            width: 100,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(20)),
            child:  Text(text))
        .inkWell(context, onTap: onTap);
  }
}
