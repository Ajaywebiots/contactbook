import 'package:flutter/material.dart';

class CommonRowLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String text;

  const CommonRowLayout({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
          onTap: onTap,
          child: Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade200,
              ),
              child: Text(text)))
    ]);
  }
}
