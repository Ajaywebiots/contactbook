import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/payment_gateway_provider/paymentutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_color.dart';
import 'package:contactbook/common/theme/app_css.dart';

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
    return Consumer2<PaymentUtils,NewProvider>(builder: (context, paymentUtilsPvr, newPvr, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor().blackColor,
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: AppColor().blackColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40))),
                                    child: const Text("Single Payment",
                                        style: TextStyle(color: Colors.white)))
                                .inkWell(onTap: () {
                              paymentUtilsPvr.isPaymentSelected = false;
                              setState(() {});
                            }, context),
                            Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: AppColor().blackColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40))),
                                    child: const Text("Subscription Plan",
                                        style: TextStyle(color: Colors.white)))
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
                                  height: Insets.i108,
                                  decoration: BoxDecoration(
                                      color: AppColor().blackColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40))),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Week Plan",
                                            style: AppCss.philosopherblack28
                                                .textColor(
                                                    AppColor().whiteColor)),
                                        Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: paymentUtilsPvr
                                                            .isPlanSelect ==
                                                        true
                                                    ? Colors.blue
                                                    : Colors.white),
                                            width: 20,
                                            height: 20)
                                      ])).inkWell(context, onTap: () async {
                                paymentUtilsPvr.isPlanSelect = true;
                                newPvr.createCustomer();
                                setState(() {});
                              }),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  alignment: Alignment.center,
                                  height: Insets.i108,
                                  decoration: BoxDecoration(
                                      color: AppColor().blackColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40))),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Month Plan",
                                            style: AppCss.philosopherblack28
                                                .textColor(
                                                    AppColor().whiteColor)),
                                        Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: paymentUtilsPvr
                                                            .isPlanSelect ==
                                                        true
                                                    ? Colors.white
                                                    : Colors.blue),
                                            width: 20,
                                            height: 20)
                                      ])).inkWell(context, onTap: () {
                                paymentUtilsPvr.isPlanSelect = false;
                                setState(() {});
                              })
                            ])
                          : SingleChildScrollView(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      alignment: Alignment.center,
                                      height: Insets.i108,
                                      decoration: BoxDecoration(
                                          color: AppColor().blackColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(40))),
                                      child: SizedBox(
                                          width: 200,
                                          child: TextField(
                                              controller:
                                                  paymentUtilsPvr.amount,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: AppCss.philosopherblack24
                                                  .textColor(
                                                      AppColor().whiteColor),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Add Amount',
                                                  hintStyle: AppCss
                                                      .philosopherblack24
                                                      .textColor(AppColor()
                                                          .whiteColor)),
                                              keyboardType:
                                                  TextInputType.number))),
                                  Container(
                                          alignment: Alignment.center,
                                          height: Insets.i108,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: AppColor().blackColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(40))),
                                          child: Text("Ok",
                                              style: AppCss.philosopherblack28
                                                  .textColor(
                                                      AppColor().whiteColor)))
                                      .inkWell(context,
                                          onTap: () => paymentUtilsPvr
                                              .stripeSinglePayment(context))
                                ]))
                    ])),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 50,
                height: 50,
                child: Text("OK"))
          ]).padding(horizontal: 20));
    });
  }
}
