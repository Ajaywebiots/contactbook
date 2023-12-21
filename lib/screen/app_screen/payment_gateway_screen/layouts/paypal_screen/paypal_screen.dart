import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/payment_gateway_provider/paypal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
        Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: TextFormField(
                controller: payPalPvr.amount,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(hintText: "Amount"),
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Amount is required")),
        Container(alignment: Alignment.center,
            height: 50,width: 100,
            color: Colors.green,
            child: Text("Paypal")).inkWell(context,onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId:
                  "AWSvIg3u2s-p7g2RYkcktJLjtn3Rsw0LZAm0CoS6WeYtEoYmSzRC01bT0wVxz4whG3eN4bCu1vparBbp",
                  secretKey:
                  "EPtAGaQiNig5iYMuxtoFs_kVimBODw7axl7hSjn21YLPi6aCRJymPoU2n9GtLWNVqXGWj155XRK7Kpcm",
                  transactions: [
                    {
                      "amount": {
                        "total": payPalPvr.amount.text,
                        "currency": "USD",
                        "details": {
                          "subtotal": payPalPvr.amount.text,
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description."
                      // "item_list": {
                      //   "items": [
                      //     {
                      //       "name": "Apple",
                      //       "quantity": 4,
                      //       "price": '5',
                      //       "currency": "USD"
                      //     },
                      //     {
                      //       "name": "Pineapple",
                      //       "quantity": 5,
                      //       "price": '10',
                      //       "currency": "USD"
                      //     }
                      //   ],
                      //   // shipping address is Optional
                      //   "shipping_address": {
                      //     "recipient_name": "Raman Singh",
                      //     "line1": "Delhi",
                      //     "line2": "",
                      //     "city": "Delhi",
                      //     "country_code": "IN",
                      //     "postal_code": "11001",
                      //     "phone": "+00000000",
                      //     "state": "Texas"
                      //   },
                      // }
                    }
                  ],
                  note: "PAYMENT_NOTE",
                  onSuccess: (Map params) async {
                    print("onSuccess: $params");
                  },
                  onError: (error) {
                    print("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                  })));
        })
      ]));
    });
  }
}
