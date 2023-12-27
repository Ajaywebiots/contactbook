import 'package:contactbook/common/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/provider/payment_gateway_provider/payment_provider.dart';

class SelectionPayment extends StatelessWidget {
  const SelectionPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
        builder: (context1, paymentUtilsPvr, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
                alignment: Alignment.center,
                height: Insets.i100,
                width: Insets.i150,
                decoration: BoxDecoration(
                    color: appColor(context).appTheme.whiteColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.i40))),
                child: Text(appFonts.singlePayment,
                    style: const TextStyle(color: Colors.black)))
            .inkWell(onTap: () => paymentUtilsPvr.onChangeTap1()),
        Container(
                alignment: Alignment.center,
                height: Insets.i100,
                width: Insets.i150,
                decoration: BoxDecoration(
                    color: appColor(context).appTheme.whiteColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.i40))),
                child: Text(appFonts.subscriptionPlan,
                    style: const TextStyle(color: Colors.black)))
            .inkWell(onTap: () => paymentUtilsPvr.onChangeTap())
      ]);
    });
  }
}
