import 'package:flutter/cupertino.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';

class FlutterWaveProvider extends ChangeNotifier {
  TextEditingController amount = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

  String publicKey = 'FLWPUBK_TEST-ff5c74c0d42d7323f5be47812a9a46c3-X';

  handlePaymentInitialization(context) async {
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
}
