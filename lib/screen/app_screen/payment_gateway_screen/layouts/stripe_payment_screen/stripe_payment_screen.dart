import 'package:contactbook/common/extension/spacing.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/payment_gateway_provider/paymentutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_css.dart';
import 'cardtype.dart';

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  // bool subscriptionSuccessful = false;

  PaymentIntent? paymentIntent;
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentUtils>(builder: (context1, paymentUtilsPvr, child) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  child: Column(
                      children: [
                        VSpace(Insets.i100),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.black,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40))),
                    child: Column(

                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: appColor(context)
                                                .appTheme
                                                .whiteColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(40))),
                                        child: const Text("Single Payment",
                                            style:
                                                TextStyle(color: Colors.black)))
                                    .inkWell(onTap: () {
                                  paymentUtilsPvr.isPaymentSelected = false;
                                  setState(() {});
                                }, context),
                                Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: appColor(context)
                                                .appTheme
                                                .whiteColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(40))),
                                        child: const Text("Subscription Plan",
                                            style:
                                                TextStyle(color: Colors.black)))
                                    .inkWell(onTap: () {
                                  setState(() {});
                                  paymentUtilsPvr.isPaymentSelected = true;
                                }, context)
                              ]),
                          paymentUtilsPvr.isPaymentSelected == true
                              ? Column(children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      alignment: Alignment.center,
                                      height: Insets.i110,
                                      decoration: BoxDecoration(
                                          color: appColor(context)
                                              .appTheme
                                              .whiteColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Week Plan",
                                                style: appCss.philosopherBold18
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .black)),
                                            Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: paymentUtilsPvr
                                                                .isPlanSelect ==
                                                            true
                                                        ? Colors.blue
                                                        : Colors.black),
                                                width: 20,
                                                height: 20)
                                          ])).inkWell(context, onTap: () async {
                                    paymentUtilsPvr.isPlanSelect = true;
                                    paymentUtilsPvr.subscriptions(
                                        context: context,
                                        priceId:
                                            'price_1NaumuSHGHXeqsVlluKpXWAv');
                                    setState(() {});
                                  }),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      alignment: Alignment.center,
                                      height: Insets.i110,
                                      decoration: BoxDecoration(
                                          color: appColor(context)
                                              .appTheme
                                              .whiteColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Month Plan",
                                                style: appCss.philosopherBold18
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .black)),
                                            Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: paymentUtilsPvr
                                                                .isPlanSelect ==
                                                            true
                                                        ? Colors.black
                                                        : Colors.blue),
                                                width: 20,
                                                height: 20)
                                          ])).inkWell(context, onTap: () {
                                    paymentUtilsPvr.isPlanSelect = false;
                                    setState(() {});
                                  })
                                ])
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      alignment: Alignment.center,
                                      height: Insets.i110,
                                      decoration: BoxDecoration(
                                          color: appColor(context)
                                              .appTheme
                                              .whiteColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(40))),
                                      child: SizedBox(
                                          width: 200,
                                          child: TextField(
                                              controller:
                                                  paymentUtilsPvr.amount,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: appCss.philosopherBold25
                                                  .textColor(appColor(context)
                                                      .appTheme
                                                      .whiteColor),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Add Amount',
                                                  hintStyle: appCss
                                                      .philosopherBold25
                                                      .textColor(
                                                          appColor(context).appTheme.black)),
                                              keyboardType: TextInputType.number))),
                                  Container(
                                          alignment: Alignment.center,
                                          height: Insets.i110,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: appColor(context)
                                                  .appTheme
                                                  .whiteColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(40))),
                                          child: Text("Ok",
                                              style: appCss
                                                  .philosopherBold18
                                                  .textColor(
                                                      appColor(context)
                                                          .appTheme
                                                          .black)))
                                      .inkWell(context,
                                          onTap: () => paymentUtilsPvr
                                              .stripeSinglePayment(context))
                                ])
                        ])),
                const VSpace(Insets.i30),
                paymentUtilsPvr.isPaymentSelected == true
                    ? Form(
                        child: Column(children: [
                        TextFormField(
                            controller: paymentUtilsPvr.cardNumCtrl,
                            keyboardType: TextInputType.number,
                            validator: CardUtils.validateCardNum,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16),
                              CardNumberInputFormatter()
                            ],
                            decoration:
                                const InputDecoration(hintText: "Card number")),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: TextFormField(
                                controller: paymentUtilsPvr.name,
                                decoration: const InputDecoration(
                                    hintText: "Full name"))),
                        Row(children: [
                          Expanded(
                              child: TextFormField(
                                  controller: paymentUtilsPvr.cvvController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    // Limit the input
                                    LengthLimitingTextInputFormatter(3)
                                  ],
                                  decoration:
                                      const InputDecoration(hintText: "CVV"))),
                          const SizedBox(width: 16),
                          Expanded(
                              child: TextFormField(
                                  controller: paymentUtilsPvr.monthController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                    CardMonthInputFormatter()
                                  ],
                                  decoration:
                                      const InputDecoration(hintText: "MM/YY")))
                        ])
                      ]))
                    : Container(),
                paymentUtilsPvr.isPaymentSelected == true
                    ? Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                            child: const Text("Add card"),
                            onPressed: () => paymentUtilsPvr.subscriptions(
                                priceId: "price_1NaumuSHGHXeqsVlluKpXWAv")))
                    : Container()
              ]).padding(horizontal: 20))));
    });
  }
}
