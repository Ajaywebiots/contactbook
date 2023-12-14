import 'package:flutter/material.dart';

class CommonPopInkwell extends StatelessWidget {
  final GestureTapCallback? onTap;

  final int? index, selectedIndex;
  final String? text;

  const CommonPopInkwell(
      {super.key, this.onTap, this.index, this.text, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: index == selectedIndex
                    ? const Color(0xff5465FF)
                    : const Color(0xffF5F6F7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(index == 0
                        ? 45
                        : index == 1
                            ? 0
                            : 0),
                    topRight: Radius.circular(index == 0
                        ? 0
                        : index == 1
                            ? 0
                            : 45),
                    bottomLeft: Radius.circular(index == 0
                        ? 45
                        : index == 1
                            ? 0
                            : 0),
                    bottomRight: Radius.circular(index == 0
                        ? 0
                        : index == 1
                            ? 0
                            : 45))),
            child: Text(text!,
                style: TextStyle(
                    color: index == selectedIndex
                        ? Colors.white
                        : Colors.black))));
  }
}
