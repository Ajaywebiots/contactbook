import 'package:contactbook/common/extension/text_style_extensions.dart';
import 'package:contactbook/common/extension/widget_extension.dart';
import 'package:contactbook/config.dart';
import 'package:flutter/material.dart';
import '../../../../../common/extension/spacing.dart';
import '../../../../../common/theme/app_css.dart';

class ButtonCommon extends StatelessWidget {
  final String title;
  final double? padding, margin, radius, height, fontSize, width;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color, fontColor, borderColor;
  final Widget? icon;
  final FontWeight? fontWeight;
  final bool isGradient;

  const ButtonCommon(
      {Key? key,
      required this.title,
      this.padding,
      this.margin = 0,
      this.radius = AppRadius.r8,
      this.height = 46,
      this.fontSize = FontSizes.f30,
      this.onTap,
      this.style,
      this.color,
      this.fontColor,
      this.icon,
      this.borderColor,
      this.width,
      this.isGradient = true,
      this.fontWeight = FontWeight.w700})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: margin!),
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? appColor(context).appTheme.trans),
            gradient: isGradient
                ? const LinearGradient(colors: [
                    Color(0xff35AAFF),
                    Color(0xff35E7FF),
                    Color(0xff35C1FF),
                  ], begin: Alignment(9, 2), end: Alignment(-2, -2))
                : null,
            color: color,
            borderRadius: BorderRadius.circular(radius!)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (icon != null)
            Row(children: [icon ?? const HSpace(0), const HSpace(Sizes.s10)]),
          Text(title,
              textAlign: TextAlign.center,
              style: style ??
                  appCss.dmDenseRegular16
                      .textColor(appColor(context).appTheme.whiteColor))
        ])).inkWell(onTap: onTap);
  }
}
