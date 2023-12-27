import 'package:contactbook/common/extension/text_style_extensions.dart';
import 'package:contactbook/common/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/provider/payment_gateway_provider/payment_provider.dart';

class StripeColumnLayout extends StatelessWidget {
  const StripeColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
        builder: (context1, paymentUtilsPvr, child) {
      return Column(children: [
        Container(
            margin: const EdgeInsets.symmetric(
                horizontal: Insets.i20, vertical: Insets.i10),
            alignment: Alignment.center,
            height: Insets.i110,
            decoration: BoxDecoration(
                color: appColor(context).appTheme.whiteColor,
                borderRadius:
                    const BorderRadius.all(Radius.circular(Insets.i40))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(appFonts.weekPlan,
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.black)),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: paymentUtilsPvr.isPlanSelect == true
                              ? Colors.blue
                              : Colors.black),
                      width: Insets.i20,
                      height: Insets.i20)
                ])).inkWell(onTap: () => paymentUtilsPvr.onTap(context)),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: Insets.i20),
            alignment: Alignment.center,
            height: Insets.i110,
            decoration: BoxDecoration(
                color: appColor(context).appTheme.whiteColor,
                borderRadius:
                    const BorderRadius.all(Radius.circular(Insets.i40))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(appFonts.monthPlan,
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.black)),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: paymentUtilsPvr.isPlanSelect == true
                              ? Colors.black
                              : Colors.blue),
                      width: Insets.i20,
                      height: Insets.i20)
                ])).inkWell(onTap: () {
          paymentUtilsPvr.isPlanSelect = false;
        })
      ]);
    });
  }
}
