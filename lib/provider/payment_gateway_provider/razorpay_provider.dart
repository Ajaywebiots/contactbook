import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../screen/app_screen/payment_gateway_screen/layouts/razor_pay_screen/demo.dart';

class RazorPayProvider extends ChangeNotifier {
  bool isPaymentSelected = false;
  bool isPlanSelect = false;
  TextEditingController amounts = TextEditingController();

  final Razorpay _razorpay = Razorpay();

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    log("Payment Successful: ${response.paymentId!}");
    Fluttertoast.showToast(
      msg: "Payment Successful ${response.paymentId!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handlePaymentError(PaymentFailureResponse response) {
    log("Payment Failure: ${response.message!}");
    Fluttertoast.showToast(
      msg: "Payment Failure ${response.message!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    log("Payment Wallet: ${response.walletName!}");
    Fluttertoast.showToast(
      msg: "Payment Wallet ${response.walletName!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  openGateWay(amount) async {
    var options = {
      'key': 'rzp_test_MSRXAX2QuYl13C',
      'amount': amount * 100,
      'name': 'Ajay',
      'description': 'Demo Payment',
      'timeout': 60,
      'prefill': {
        'contact': '9000090000',
        'email': 'ajay.hariyani@gmail.com',
      },
      "external": {
        'wallets': ['paytm'],
      }
    };
    log("Opening RazorPay Gateway with options: $options");
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('RazorPay error: $e');
    }
  }

  sub() {
    createOrder().then((orderId) {
      log("orderId: $orderId");
      if (orderId.toString().isNotEmpty) {
        var options = {
          'key': 'rzp_test_MSRXAX2QuYl13C',
          "subscription_id": "sub_NGvYbZDsWNIcmm",
          'name': 'Company Name',
          "recurring": true,
          "confirm_close": true,
          'order_id': orderId,
          'description': 'Description for order',
          'timeout': 360,
          'prefill': {
            'contact': '9123456789',
            'email': 'flutterwings304@gmail.com'
          },
        };
        _razorpay.open(options);
      } else {
        log("EERRR");
      }
    });
  }

  initFunction() {
    notifyListeners();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }
}
