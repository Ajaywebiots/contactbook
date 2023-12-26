import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/payment_gateway_provider/phone_pe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhonePePayment extends StatefulWidget {
  const PhonePePayment({super.key});

  @override
  State<PhonePePayment> createState() => _PhonePePaymentState();
}

class _PhonePePaymentState extends State<PhonePePayment> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PhonePeProvider>(builder: (context, phonePePvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 50))
              .then((value) => phonePePvr.onInit()),
          child: Scaffold(
              appBar: AppBar(title: const Text('PhonePe Payment Gateway')),
              body: Column(children: [
                ElevatedButton(
                    onPressed: () => phonePePvr.startPgTransaction(),
                    child: const Text("Start Transaction")),
                Text("Result \n ${phonePePvr.result}")
              ])));
    });
  }
}
