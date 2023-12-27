import 'package:contactbook/common/extension/spacing.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/payment_gateway_provider/payment_provider.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/stripe_payment_screen/layouts/selection_payment.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/stripe_payment_screen/layouts/stripe_column_layout.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/stripe_payment_screen/layouts/stripe_row_layout.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/stripe_payment_screen/stripe_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
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
    return Consumer<PaymentProvider>(
        builder: (context1, paymentUtilsPvr, child) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  child: Column(children: [
                const VSpace(Insets.i100),
                Container(
                    padding: const EdgeInsets.all(Insets.i20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.black,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(Insets.i40))),
                    child: Column(children: [
                      const SelectionPayment(),
                      paymentUtilsPvr.isPaymentSelected == true
                          ? const StripeColumnLayout()
                          : const StripeRowLayout()
                    ])),
                const VSpace(Insets.i30),
                paymentUtilsPvr.isPaymentSelected == true
                    ? const StripeFormLayout()
                    : Container(),
                paymentUtilsPvr.isPaymentSelected == true
                    ? Padding(
                        padding: const EdgeInsets.only(top: Insets.i16),
                        child: ElevatedButton(
                            child: const Text("Add card"),
                            onPressed: () => paymentUtilsPvr.subscriptions(
                                priceId: "price_1NaumuSHGHXeqsVlluKpXWAv")))
                    : Container()
              ]).padding(horizontal: 20))));
    });
  }
}
