import 'dart:developer';
import 'package:contactbook/config.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:uuid/uuid.dart';

class FlutterWaveScreen extends StatefulWidget {
  const FlutterWaveScreen({super.key});

  @override
  _FlutterWaveScreenState createState() => _FlutterWaveScreenState();
}

class _FlutterWaveScreenState extends State<FlutterWaveScreen> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;

    return Scaffold(
        appBar:
            AppBar(title: Text('FlutterWave'), backgroundColor: Colors.black),
        body: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Form(
                key: formKey,
                child: ListView(children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: TextFormField(
                      controller: amountController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(hintText: "Amount"),
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : "Amount is required",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: TextFormField(
                      controller: currencyController,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.black),
                      readOnly: true,
                      onTap: _openBottomSheet,
                      decoration: const InputDecoration(
                        hintText: "Currency",
                      ),
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : "Currency is required",
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(color: Colors.black),
                          decoration:
                              const InputDecoration(hintText: "Email"))),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: TextFormField(
                          controller: phoneNumberController,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(color: Colors.black),
                          decoration:
                              const InputDecoration(hintText: "Phone Number"))),
                  Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: _onPressed,
                          child: const Text("Make Payment",
                              style: TextStyle(color: Colors.white))))
                ]))));
  }

  _onPressed() {
    final currentState = formKey.currentState;
    if (currentState != null && currentState.validate()) {
      _handlePaymentInitialization();
    }
  }

  _handlePaymentInitialization() async {
    final Customer customer = Customer(
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
    );

    final Flutterwave flutterWave = Flutterwave(
        context: context,
        publicKey: 'FLWPUBK_TEST-ff5c74c0d42d7323f5be47812a9a46c3-X',
        currency: selectedCurrency,
        redirectUrl: 'https://api.flutterwave.com/v3/payments',
        txRef: Uuid().v4(),
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
      showLoading(response.status.toString());
    }
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }

  Widget _getCurrency() {
    final currencies = [
      "NGN",
      "RWF",
      "UGX",
      "KES",
      "ZAR",
      "USD",
      "GHS",
      "TZS",
    ];
    return Container(
        height: 250,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: Colors.white,
        child: ListView(
            children: currencies
                .map((currency) => ListTile(
                    onTap: () => {_handleCurrencyTap(currency)},
                    title: Column(children: [
                      Text(currency,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.black)),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ])))
                .toList()));
  }

  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }

  Future<void> showLoading(String message) {
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
