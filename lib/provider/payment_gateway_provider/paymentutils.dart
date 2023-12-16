import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentUtils extends ChangeNotifier{

  bool isPaymentSelected = false;


  bool isPlanSelect = false;

  TextEditingController amount = TextEditingController();

  static var publishKey =
      'pk_test_51I4llmDtrRJEUyttSD9XE6wutfZoCETc7eaQ5VkBHCKE2yvOe6QfC6UmcxpOGpenPE3LePnPNT8gKMinRwuheTfn00jOIXTO9p';
  static var secretKey =
      'sk_test_51I4llmDtrRJEUyttFVaL6eUC2IqOKMvDTI42EbnBHUFiZ4IkCYrYURhLYW9zkRD3HrKyhNygC3ETP4aPanlvRRk500Zyg4loGK';

  Map<String, dynamic>? paymentIntent;


  Future<void> makePayment(context) async {
    try {
      log("message ${amount.text}");
      paymentIntent = await createPaymentIntent(amount.text, 'INR');
      log("messagesjkfghdshjgf   $paymentIntent");
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              googlePay: const PaymentSheetGooglePay(
                  testEnv: true,
                  currencyCode: "IN",
                  merchantCountryCode: "+91"),
              style: ThemeMode.dark,
              merchantDisplayName: 'AJAY'));
      displayPaymentSheet(context);
    } catch (e) {
      if (kDebugMode) {
        print("exception $e");
      }
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer $secretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body);
      print('Payment Intent Body: ${response.body.toString()}');
      return jsonDecode(response.body.toString());
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }

  displayPaymentSheet(context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  Text("Payment Successful")
                ])
              ])));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paid successfully")),
      );
    } on StripeException catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(content: Text("Cancelled")),
      );
    } catch (e) {
      print('$e');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }




  stripeSinglePayment(context){
  try {
  makePayment(context);
  } catch (e) {
  log("message$e");
  }
  }

  final client = http.Client();


  static Map<String, String> headers = {
    'Authorization': 'Bearer $secretKey',
    'Content-Type': 'application/x-www-form-urlencoded'
  };


  Future<Map<String, dynamic>> createPaymentIntents() async {
    final String url = 'https://api.stripe.com/v1/payment_intents';

    Map<String, dynamic> body = {
      'amount': '2000',
      'currency': 'jpy',
      'payment_method_types[]': 'card'
    };

    var response =
    await client.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to create PaymentIntents.';
    }
  }


  //
  // Future<void> payment() async {
  //   _init();
  //   final _customer = await _createCustomer();
  //   final _paymentIntent = await _createPaymentIntents();
  //   await _createCreditCard(_customer['id'], _paymentIntent['client_secret']);
  // }
  //
  //
  //
  //















}