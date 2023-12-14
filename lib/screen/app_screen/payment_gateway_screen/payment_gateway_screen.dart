import 'package:contactbook/common/theme/app_color.dart';
import 'package:contactbook/extensions/spacing.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/theme/app_css.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff141316),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            height: Insets.i108,
            decoration: const BoxDecoration(
                color: Color(0xff0DF69E),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Column(
              children: [
                const VSpace(Insets.i10),
                const Text("Make Payment"),
                const VSpace(Insets.i10),
                SizedBox(
                    width: 200,
                    child: TextField(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: AppCss.philosopherblack36,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Amount',
                            hintStyle: AppCss.philosopherblack36),
                        keyboardType: TextInputType.number)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColor().whiteColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                );
              },
            ),
          )
        ]).padding(horizontal: 20));
  }
}
