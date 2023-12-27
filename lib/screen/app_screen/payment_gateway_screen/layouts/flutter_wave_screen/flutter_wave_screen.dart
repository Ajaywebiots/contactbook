import 'package:contactbook/provider/payment_gateway_provider/flutter_wave_provider.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/razor_pay_screen/layouts/custom_amount_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/theme/app_css.dart';

class FlutterWaveScreen extends StatefulWidget {
  const FlutterWaveScreen({super.key});

  @override
  _FlutterWaveScreenState createState() => _FlutterWaveScreenState();
}

class _FlutterWaveScreenState extends State<FlutterWaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlutterWaveProvider>(
        builder: (context, flutterWavePvr, child) {
      flutterWavePvr.currencyController.text = flutterWavePvr.selectedCurrency;
      return Scaffold(
          appBar: AppBar(
              title: const Text('FlutterWave'), backgroundColor: Colors.black),
          body: Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Form(
                  key: flutterWavePvr.formKey,
                  child: ListView(children: <Widget>[
                    CustomAmountFormField(
                        keyboardType: TextInputType.number,
                        controller: flutterWavePvr.amountController,
                        hintText: 'Amount',
                        validator: (value) => value != null && value.isNotEmpty
                            ? null
                            : "Amount is required"),
                    Container(
                        margin: const EdgeInsets.fromLTRB(Insets.i0, Insets.i20, Insets.i0, Insets.i10),
                        child: TextFormField(
                            readOnly: true,onTap: () => flutterWavePvr.openBottomSheet(context),
                            controller: flutterWavePvr.currencyController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(hintText: 'Currency'),
                            validator: (value) => value != null && value.isNotEmpty
                                ? null
                                : "Currency is required")),
                    CustomAmountFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: flutterWavePvr.emailController,
                        hintText: 'Email',
                        validator: (value) {
                          return null;
                        }),
                    CustomAmountFormField(
                        keyboardType: TextInputType.number,
                        controller: flutterWavePvr.phoneNumberController,
                        hintText: 'Phone Number',
                        validator: (value) {
                          return null;
                        }),
                    Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () => flutterWavePvr.onPressed(context),
                            child: const Text("Make Payment",
                                style: TextStyle(color: Colors.white))))
                  ]))));
    });
  }
}
