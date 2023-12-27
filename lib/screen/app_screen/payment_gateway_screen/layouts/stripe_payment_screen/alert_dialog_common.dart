import 'package:contactbook/common/extension/text_style_extensions.dart';
import 'package:contactbook/common/extension/widget_extension.dart';
import 'package:contactbook/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/extension/spacing.dart';
import '../../../../../common/theme/app_css.dart';
import 'button.dart';

class AlertDialogCommon extends StatelessWidget {
  final String? image, title, subtext, bText1, reward;
  final GestureTapCallback? b1OnTap, crossOnTap;
  final TextStyle? style;
  final double? height;
  final bool? isReward;

  const AlertDialogCommon(
      {Key? key,
      this.title,
      this.b1OnTap,
      this.bText1,
      this.image,
      this.subtext,
      this.crossOnTap,
      this.height,
      this.isReward = false,
      this.style,
      this.reward})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r14))),
        backgroundColor: appColor(context).appTheme.whiteColor,
        content: Stack(alignment: Alignment.topRight, children: [
          Column(mainAxisSize: MainAxisSize.min, children: [
            const VSpace(Sizes.s55),
            Image.asset(image!, height: height ?? Sizes.s190),
            if (isReward == true)
              Column(children: [
                const VSpace(Sizes.s10),
                Text("rewardLeft",
                    style: appCss.philosopherBold25
                        .textColor(appColor(context).appTheme.primary))
              ]),
            const VSpace(Sizes.s18),
            Text(subtext!,
                    textAlign: TextAlign.center,
                    style: style ??
                        appCss.philosopherBold25
                            .textColor(appColor(context).appTheme.textFieldClr)
                            .textHeight(1.3))
                .paddingSymmetric(horizontal: Insets.i5),
            const VSpace(Sizes.s25),
            ButtonCommon(onTap: b1OnTap, title: bText1!)
          ]).paddingAll(Insets.i20),
          Column(mainAxisSize: MainAxisSize.min, children: [
            const VSpace(Sizes.s5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(title!,
                      style: appCss.dmDenseSemiBold20
                          .textColor(appColor(context).appTheme.textFieldClr))
                  .paddingSymmetric(horizontal: Insets.i20),
              IconButton(
                  onPressed: crossOnTap,
                  icon: Icon(CupertinoIcons.multiply,
                      size: Sizes.s20,
                      color: appColor(context).appTheme.lightText))
            ]),
            const VSpace(Sizes.s5)
          ])
        ]));
  }
}
