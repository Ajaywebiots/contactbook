import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/payment_gateway_provider/razorpay_provider.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/common_pay_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/theme/app_css.dart';
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
                    hintText: 'Amount',
                    keyboardType: TextInputType.number,
                    controller: razorPayPvr.amounts,
                    validator: (value) => value != null && value.isNotEmpty
                        ? null
                        : "Amount is required"),
                CommonPayButton(text: 'Pay', onTap: () => razorPayPvr.onTap()),
                InkWell(
                    onTap: () => razorPayPvr.sub(),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: Insets.i20),
                        alignment: Alignment.center,
                        height: Insets.i110,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(Insets.i40))),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Month Plan ₹100",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Insets.i18,
                                      fontWeight: FontWeight.bold))
                            ])))
              ])));
    });
  }
}
