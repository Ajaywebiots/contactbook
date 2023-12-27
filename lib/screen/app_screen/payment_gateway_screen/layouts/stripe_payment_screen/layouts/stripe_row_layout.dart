import 'package:contactbook/common/extension/text_style_extensions.dart';
import 'package:contactbook/common/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/provider/payment_gateway_provider/payment_provider.dart';

class StripeRowLayout extends StatelessWidget {
  const StripeRowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
        builder: (context1, paymentUtilsPvr, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: Insets.i10),
            alignment: Alignment.center,
            height: Insets.i110,
            decoration: BoxDecoration(
                color: appColor(context).appTheme.whiteColor,
                borderRadius:
                    const BorderRadius.all(Radius.circular(Insets.i40))),
            child: SizedBox(
                width: Insets.i200,
                child: TextField(
                    controller: paymentUtilsPvr.amount,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: appCss.philosopherBold25
                        .textColor(appColor(context).appTheme.whiteColor),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Amount',
                        hintStyle: appCss.philosopherBold25
                            .textColor(appColor(context).appTheme.black)),
                    keyboardType: TextInputType.number))),
        Container(
                alignment: Alignment.center,
                height: Insets.i110,
                width: Insets.i100,
                decoration: BoxDecoration(
                    color: appColor(context).appTheme.whiteColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.i40))),
                child: Text("Ok",
                    style: appCss.philosopherBold18
                        .textColor(appColor(context).appTheme.black)))
            .inkWell(onTap: () => paymentUtilsPvr.stripeSinglePayment(context))
      ]);
    });
  }
}
