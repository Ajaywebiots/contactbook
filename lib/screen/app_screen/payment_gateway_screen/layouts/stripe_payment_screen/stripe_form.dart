import 'package:contactbook/config.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/stripe_payment_screen/cardtype.dart';
import 'package:contactbook/provider/payment_gateway_provider/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_css.dart';

class StripeFormLayout extends StatelessWidget {
  const StripeFormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
        builder: (context, paymentUtilsPvr, child) {
      return Form(
          child: Column(children: [
        TextFormField(
            decoration: InputDecoration(hintText: appFonts.cardNumber),
            controller: paymentUtilsPvr.cardNumCtrl,
            keyboardType: TextInputType.number,
            validator: CardUtils.validateCardNum,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter()
            ]),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
                controller: paymentUtilsPvr.name,
                decoration: InputDecoration(hintText: appFonts.fullName))),
        Row(children: [
          Expanded(
              child: TextFormField(
                  decoration: InputDecoration(hintText: appFonts.cvv),
                  controller: paymentUtilsPvr.cvvController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                // Limit the input
                LengthLimitingTextInputFormatter(3)
              ])),
          const SizedBox(width: Insets.i16),
          Expanded(
              child: TextFormField(
                  decoration: InputDecoration(hintText: appFonts.mmYY),
                  controller: paymentUtilsPvr.monthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
                CardMonthInputFormatter()
              ]))
        ])
      ]));
    });
  }
}
