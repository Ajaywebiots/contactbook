import 'package:flutter/material.dart';

class CommonContainerButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? color;

  const CommonContainerButton(
      {super.key, required this.text, this.textColor, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: const Color(0xff5465FF)),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        height: MediaQuery.of(context).size.height * 0.06,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16)));
  }
}
