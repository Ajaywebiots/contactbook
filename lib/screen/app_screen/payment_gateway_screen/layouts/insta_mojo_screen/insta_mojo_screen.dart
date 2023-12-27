import 'package:contactbook/config.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/razor_pay_screen/layouts/custom_amount_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/provider/payment_gateway_provider/insta_mojo_provider.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/insta_mojo_screen/insta_mojo.dart';

class InstaMojoScreen extends StatefulWidget {
  const InstaMojoScreen({super.key});

  @override
  _InstaMojoScreenState createState() => _InstaMojoScreenState();
}
class _InstaMojoScreenState extends State<InstaMojoScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<InstaMojoProvider>(builder: (context, instaMojoPvr, child) {
      return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomAmountFormField(
            keyboardType: TextInputType.number,
            controller: instaMojoPvr.amount,
            hintText: appFonts.amount,
            validator: (value) => value != null && value.isNotEmpty
                ? null
                : appFonts.amountIsRequired),
        ElevatedButton(
            child: Text(appFonts.instaMOJO),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InstaMojo()));
            })
      ]));
    });
  }
}
