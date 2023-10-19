import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorListLayout extends StatelessWidget {
  final bool? isSelected;
  final GestureTapCallback? onColorSelected;
  final dynamic colorList;

  const ColorListLayout(
      {super.key, this.isSelected, this.colorList, this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onColorSelected,
        tileColor: Colors.blue.shade50,
        leading: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Color(int.parse(colorList.substring(1, 7), radix: 16) +
                    0xFF000000),
                border: Border.all(color: Colors.white)),
            height: 20,
            width: 30),
        title: Text("$colorList"),
        trailing: Container(
            height: 20,
            width: 20,
            decoration: ShapeDecoration(
                color:
                    isSelected == true ? const Color(0xff5465FF) : Colors.white,
                shape: SmoothRectangleBorder(
                    side: BorderSide(
                        color: isSelected == true
                            ? Colors.transparent
                            : const Color(0xffE5E8EA)),
                    borderRadius: const SmoothBorderRadius.all(
                        SmoothRadius(cornerRadius: 5, cornerSmoothing: 1)))),
            child: isSelected == true
                ? SvgPicture.asset("assets/svg/tick.svg",
                    fit: BoxFit.scaleDown, height: 10, width: 10)
                : null));
  }
}
