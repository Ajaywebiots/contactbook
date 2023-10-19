import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SizeLayout extends StatelessWidget {
  final bool? isSelected;
  final GestureTapCallback? onTap;
  final String? title;

  const SizeLayout(
      {super.key, this.isSelected = false, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: Text(title!),
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
