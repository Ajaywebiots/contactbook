import 'package:contactbook/common/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? buttonLayout;
  final AlignmentGeometry? textAlign;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;

  const CustomButton({
    Key? key,
    this.buttonLayout,
    this.textAlign,
    this.width,
    this.padding,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: textAlign,
        width: width!,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor().blackColor26,
                blurRadius: 10.0,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColor().primaryColor,
                AppColor().buttonColor1,
                AppColor().buttonColor2,
              ],
            ),
            borderRadius: BorderRadius.circular(5.0)),
        child: buttonLayout,
      ),
    );
  }
}
