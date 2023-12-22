import 'dart:convert';
import 'dart:developer';

import 'package:contactbook/common/extension/widget_extension.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../common/theme/app_css.dart';
import '../../../../../provider/payment_gateway_provider/razorpay_provider.dart';

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
    // TODO: implement initState

    razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.initState();
  }

  void handlePaymentSuccess(context, PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Successful ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
    // Do something when payment succeeds
  }

  void handlePaymentError(context, PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failure ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
    // Do something when payment fails
  }

  void handleExternalWallet(context, ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Wallet ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
    // Do something when an external wallet is selected
  }

  openGateWay(amount) async {
    var options = {
      'key': 'rzp_test_Q3xjGiqAY2oSXU',
      'amount': amount * 100,
      'name': 'Ajay',
      // 'order_id': 'order_EMBFqjDHEEn80l',
      'description': 'Demo Payment',
      'timeout': 60,
      'prefill': {'contact': '9000090000', 'email': 'ajay.hariyani@gmail.com'},
      "external": {
        'wallets': ['paytm']
      }
    };
    log("message  $options");
    try {
      razorPay.open(options);
    } catch (e) {
      debugPrint('error :: $e');
    }
  }

  subscriptionAWeek() {
    var options = {
      'key': 'rzp_test_Q3xjGiqAY2oSXU',
      //Razor pay API Key
      "subscription_id": "sub_NFIasnS3eMzV2c",
      //in the smallest currency sub-unit.
      'name': 'Company Name.',
      "recurring": true,
      "confirm_close": true,
      'order_id': '	plan_NFI4jponmWFsvM',
      // Generate order_id using Orders API
      'description': 'Description for order',
      //Order Description to be shown in razor pay page
      'timeout': 360,
      // in seconds
      'prefill': {
        'contact': '9712928612',
        'email': 'flutterwing@gmail.com'
        //contact number and email id of user
      }
    };
    log("message  $options");
    try {
      razorPay.open(options);
    } catch (e) {
      debugPrint('error :: $e');
    }
  }

  Future<void> createSubscription() async {
    const String apiUrl = 'https://your-api-endpoint.com/create-subscription';

    final Map<String, dynamic> requestData = {
      'amount': amounts.text,
      'plan_id': 'your_plan_id',
      'contact': '9712928612',
      'email': 'flutterwings304@gmail.com',
      // Add other subscription parameters as needed
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String subscriptionId = responseData['subscription_id'];
        // subscriptionBMonth(subscriptionId);
      } else {
        print('Failed to create subscription. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle error appropriately
      }
    } catch (e) {
      print('Error creating subscription: $e');
      // Handle error appropriately
    }
  }


  subscriptionBMonth() {
    var options = {
      'key': 'rzp_test_Q3xjGiqAY2oSXU',
      //Razor pay API Key
      "subscription_id": "sub_NFIasnS3eMzV2c",
      //in the smallest currency sub-unit.
      'name': 'Company Name.',
      "recurring": true,
      "confirm_close": true,
      'order_id': 'plan_NFI4jponmWFsvM',
      // Generate order_id using Orders API
      'description': 'Description for order',
      //Order Description to be shown in razor pay page
      'timeout': 360,
      // in seconds
      'prefill': {
        'contact': '9712928612',
        'email': 'flutterwings304@gmail.com'
        //contact number and email id of user
      }
    };
    log("message  $options");
    try {
      razorPay.open(options);
    } catch (e) {
      debugPrint('error :: $e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    razorPay.clear();
    super.dispose();
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
        Row(
          children: [
            InkWell(
                onTap: () => subscriptionAWeek(),
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    height: Insets.i110,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.whiteColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Month Plan ₹300",
                              style: appCss.philosopherBold18
                                  .textColor(appColor(context).appTheme.black)),
                        ]))),
            InkWell(
                onTap: () => subscriptionBMonth(),
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    height: Insets.i110,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.whiteColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Month Plan ₹300",
                              style: appCss.philosopherBold18
                                  .textColor(appColor(context).appTheme.black)),
                        ]))),
          ],
        )
      ]));
    });
  }
}
