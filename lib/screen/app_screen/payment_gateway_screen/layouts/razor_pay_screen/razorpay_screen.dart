import 'dart:convert';
import 'dart:developer';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/provider/payment_gateway_provider/razorpay_provider.dart';

import 'demo.dart';

class RazorPayScreen extends StatefulWidget {
  const RazorPayScreen({super.key});

  @override
  State<RazorPayScreen> createState() => _RazorPayScreenState();
}

class _RazorPayScreenState extends State<RazorPayScreen> {
  TextEditingController amounts = TextEditingController();
  late Razorpay razorPay;

  @override
  void initState() {
    log("Initializing RazorPayScreen");
    razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.initState();
  }

  void handlePaymentSuccess(context, PaymentSuccessResponse response) {
    log("Payment Successful: ${response.paymentId!}");
    Fluttertoast.showToast(
        msg: "Payment Successful ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(context, PaymentFailureResponse response) {
    log("Payment Failure: ${response.message!}");
    Fluttertoast.showToast(
        msg: "Payment Failure ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(context, ExternalWalletResponse response) {
    log("Payment Wallet: ${response.walletName!}");
    Fluttertoast.showToast(
        msg: "Payment Wallet ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  openGateWay(amount) async {
    var options = {
      'key': 'rzp_test_Q3xjGiqAY2oSXU',
      'amount': amount * 100,
      'name': 'Ajay',
      'description': 'Demo Payment',
      'timeout': 60,
      'prefill': {'contact': '9000090000', 'email': 'ajay.hariyani@gmail.com'},
      "external": {
        'wallets': ['paytm']
      }
    };
    log("Opening RazorPay Gateway with options: $options");
    try {
      razorPay.open(options);
    } catch (e) {
      debugPrint('RazorPay error: $e');
    }
  }

  sub() {
    createOrderId().then((value) {
      log("Creating Order ID: $value");
      if (value.toString().isNotEmpty) {
        var options = {
          'key': 'rzp_test_Q3xjGiqAY2oSXU',
          "subscription_id": 'sub_NFIcnGFHmtbvOS',
          'name': 'Company Name.',
          "recurring": true,
          "confirm_close": true,
          'order_id': value['id'],
          'description': 'Description for order',
          'timeout': 360,
          'prefill': {'contact': '9712928612', 'email': 'xyz@gmail.com'}
        };
        log("Opening RazorPay Gateway with options: $options");
        razorPay.open(options);
        // razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
        // razorPay.on(
        //     Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      } else {
        log("Error: Order ID is empty");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RazorPayProvider>(builder: (context, razorPayPvr, child) {
      return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                    controller: amounts,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(hintText: "Amount"),
                    validator: (value) => value != null && value.isNotEmpty
                        ? null
                        : "Amount is required")),
            InkWell(
                onTap: () {
                  if (amounts.text.toString().isNotEmpty) {
                    setState(() {
                      int amount = int.parse(amounts.text.toString());
                      log("Amount entered: $amount");
                      openGateWay(amount);
                    });
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    color: Colors.black,
                    child: Text("Pay",
                        style: appCss.philosopherBold25
                            .textColor(appColor(context).appTheme.whiteColor)))),
            InkWell(
                onTap: () => sub(),
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    height: Insets.i110,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.whiteColor,
                        borderRadius: const BorderRadius.all(Radius.circular(40))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Month Plan ₹300",
                              style: appCss.philosopherBold18
                                  .textColor(appColor(context).appTheme.black))
                        ])))
          ]));
    });
  }
}
