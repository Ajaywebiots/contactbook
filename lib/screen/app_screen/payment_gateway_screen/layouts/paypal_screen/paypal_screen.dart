import 'dart:developer';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:contactbook/provider/payment_gateway_provider/paypal_provider.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/paypal_screen/paypal_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayPalScreen extends StatefulWidget {
  const PayPalScreen({super.key});

  @override
  State<PayPalScreen> createState() => _PayPalScreenState();
}

class _PayPalScreenState extends State<PayPalScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PayPalProvider>(builder: (context, payPalPvr, child) {
      return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
            child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                height: 50,
                child: Text("Pay",
                    style: appCss.philosopherBold25
                        .textColor(appColor(context).appTheme.whiteColor))),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId:
                        "AWSvIg3u2s-p7g2RYkcktJLjtn3Rsw0LZAm0CoS6WeYtEoYmSzRC01bT0wVxz4whG3eN4bCu1vparBbp",
                    secretKey:
                        "EPtAGaQiNig5iYMuxtoFs_kVimBODw7axl7hSjn21YLPi6aCRJymPoU2n9GtLWNVqXGWj155XRK7Kpcm",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      Navigator.pop(context);
                    },
                    onError: (error) {
                      log("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      log('cancelled:');
                      Navigator.pop(context);
                    },
                    transactions: const [
                      {
                        "amount": {
                          "total": '100',
                          "currency": "USD",
                          "details": {
                            "subtotal": '100',
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        "item_list": {}
                      }
                    ],
                    note: "Contact us for any questions on your order."))))
      ]));
    });
  }
}
