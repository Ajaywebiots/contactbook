import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesLayout extends StatelessWidget {
   final dynamic data;
   final GestureTapCallback? onTap;
  const CategoriesLayout({super.key,this.data,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
            borderRadius: SmoothBorderRadius(cornerRadius: 5)),
        child: ListTile(
            trailing: InkWell(
                onTap: onTap,
                child: Container(
                    height: 20,
                    width: 20,
                    decoration: ShapeDecoration(
                        color: data['isCheck'] ==
                            true
                            ? const Color(0xff5465FF)
                            : Colors.white,
                        shape: SmoothRectangleBorder(
                            side: BorderSide(
                                color: data
                                ['isCheck'] ==
                                    true
                                    ? Colors.transparent
                                    : const Color(0xffE5E8EA)),
                            borderRadius:
                            const SmoothBorderRadius.all(
                                SmoothRadius(
                                    cornerRadius: 5,
                                    cornerSmoothing: 1)))),
                    child: data['isCheck'] == true
                        ? SvgPicture.asset(
                      "assets/svg/tick.svg",
                      fit: BoxFit.scaleDown,
                      height: 14,
                      width: 14,
                    )
                        : null)),
            leading: SvgPicture.asset(data['icon']),
            title: Text(data['title'])));
  }
}
