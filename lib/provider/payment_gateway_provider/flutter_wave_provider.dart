import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:uuid/uuid.dart';

import '../../config.dart';

class FlutterWaveProvider extends ChangeNotifier {
  TextEditingController amount = TextEditingController();

  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

  String publicKey = 'FLWPUBK_TEST-ff5c74c0d42d7323f5be47812a9a46c3-X';

  handlePaymentInitializations(context) async {
    final Customer customer = Customer(
        name: fullName.text, phoneNumber: phone.text, email: email.text);
    final Flutterwave flutterWave = Flutterwave(
        context: context,
        publicKey: publicKey,
        currency: "INR",
        redirectUrl: "add-your-redirect-url-here",
        txRef: "add-your-unique-reference-here",
        amount: "3000",
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "My Payment"),
        isTestMode: true);
  }
  String secretKey = 'FLWSECK_TEST-07da02675ebeddf8e79e85148e877a3b-X';
  String encryptionKey = 'FLWSECK_TESTb4a36eb48266';

  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String selectedCurrency = "";

  onPressed(context) {
    final currentState = formKey.currentState;
    if (currentState != null && currentState.validate()) {
      handlePaymentInitialization(context);
    }
  }

  handlePaymentInitialization(context) async {
    final Customer customer = Customer(
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
    );

    final Flutterwave flutterWave = Flutterwave(
        context: context,
        publicKey: 'FLWPUBK_TEST-ff5c74c0d42d7323f5be47812a9a46c3-X',
        currency: selectedCurrency,
        redirectUrl: 'https://api.flutterwave.com/v3/payments',
        txRef: const Uuid().v4(),
        amount: amountController.text.toString().trim(),
        customer: customer,
        paymentOptions: "Card, payattitude, barter, Bank Transfer, USSD",
        customization: Customization(title: "Test Payment"),
        isTestMode: true);

    final ChargeResponse response = await flutterWave.charge();
    log("ss${response.toJson()}");
    log("ss$flutterWave");
    log("dd${response.status}");
    log("ff${response.success}");
    log("gg${response.transactionId}");
    log("hh${response.txRef}");
    if (response.status == response.success) {
      hideLoading(response.status.toString());
      log("message::::success");
    } else {
      log("message::::failure");
      showLoading(response.status.toString(), context);
    }
  }

  openBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return getCurrency(context);
        });
  }

  Widget getCurrency(context) {
    final currencies = ["NGN", "RWF", "UGX", "KES", "ZAR", "USD", "GHS", "TZS"];
    return Container(
        height: 250,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: Colors.white,
        child: ListView(
            children: currencies
                .map((currency) => ListTile(
                    onTap: () => {handleCurrencyTap(currency, context)},
                    title: Column(children: [
                      Text(currency,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.black)),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ])))
                .toList()));
  }

  handleCurrencyTap(String currency, context) {
    notifyListeners();
    selectedCurrency = currency;
    currencyController.text = currency;
    Navigator.pop(context);
  }

  Future<void> showLoading(String message, context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  width: double.infinity,
                  height: 50,
                  child: Text(message)));
        });
  }
}
