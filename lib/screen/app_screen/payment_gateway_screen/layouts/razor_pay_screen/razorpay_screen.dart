import 'dart:developer';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/payment_gateway_provider/razorpay_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'layouts/custom_amount_formfield.dart';

class RazorPayScreen extends StatefulWidget {
  const RazorPayScreen({Key? key}) : super(key: key);

  @override
  State<RazorPayScreen> createState() => _RazorPayScreenState();
}

class _RazorPayScreenState extends State<RazorPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RazorPayProvider>(builder: (context, razorPayPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 50),
              () => razorPayPvr.initFunction()),
          child: Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                CustomAmountFormField(
                    controller: razorPayPvr.amounts,
                    validator: (value) => value != null && value.isNotEmpty
                        ? null
                        : "Amount is required"),
                InkWell(
                    onTap: () {
                      if (razorPayPvr.amounts.text.toString().isNotEmpty) {
                        setState(() {
                          int amount =
                              int.parse(razorPayPvr.amounts.text.toString());
                          log("Amount entered: $amount");
                          razorPayPvr.openGateWay(amount);
                        });
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: double.infinity,
                        color: Colors.black,
                        child: const Text("Pay",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)))),
                InkWell(
                    onTap: () => razorPayPvr.sub(),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        height: 110,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Month Plan ₹100",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))
                            ])))
              ])));
    });
  }
}
