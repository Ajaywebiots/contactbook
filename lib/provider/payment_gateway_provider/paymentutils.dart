import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../../screen/app_screen/payment_gateway_screen/layouts/demo.dart';

class PaymentUtils extends ChangeNotifier {
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

  stripeSinglePayment(context) {
    try {
      makePayment(context);
    } catch (e) {
      log("message$e");
    }
  }
//
// final client = http.Client();
//
// static Map<String, String> headers = {
//   'Authorization': 'Bearer $secretKey',
//   'Content-Type': 'application/x-www-form-urlencoded'
// };
//
// Future<Map<String, dynamic>> createPaymentIntents() async {
//   const String url = 'https://api.stripe.com/v1/payment_intents';
//
//   Map<String, dynamic> body = {
//     'amount': '2000',
//     'currency': 'jpy',
//     'payment_method_types[]': 'card'
//   };
//
//   var response =
//       await client.post(Uri.parse(url), headers: headers, body: body);
//   if (response.statusCode == 200) {
//     return json.decode(response.body);
//   } else {
//     print(json.decode(response.body));
//     throw 'Failed to create PaymentIntents.';
//   }
// }

/////////////////////////////

// Map<String, dynamic>? paymentIntentData;
// // Stripe Payment Method
// Future<void> stripePayment(context,
//     {required String amount, required String currency}) async {
//   try {
//     paymentIntentData = await createPaymentIntent(amount, currency);
//     if (paymentIntentData != null) {
//       await Stripe.instance.initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               merchantDisplayName: 'AJAY',
//               customerId: paymentIntentData!['customer'],
//               paymentIntentClientSecret: paymentIntentData!['client_secret'],
//               customerEphemeralKeySecret:
//                   paymentIntentData!['ephemeralKey']));
//       displayPaymentSheet(context);
//       notifyListeners();
//     }
//   } catch (e) {
//     throw Exception("$e");
//   }
//   notifyListeners();
// }
//
// // Stripe Error handler
// displayPaymentSheetS(context) async {
//   try {
//     await Stripe.instance.presentPaymentSheet();
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (context) {
//           return Container();
//         });
//   } catch (e) {
//     print(e);
//   }
//   notifyListeners();
// }
//
// // Stripe Create payment Method
// createPaymentIntentS(String amount, String currency) async {
//   try {
//     Map<String, dynamic> body = {
//       'amount': calculateAmountA(amount),
//       'currency': currency,
//       'payment_method_types[]': 'card'
//     };
//     var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         body: body,
//         headers: {
//           'Authorization':
//               'Bearer sk_test_51I4llmDtrRJEUyttFVaL6eUC2IqOKMvDTI42EbnBHUFiZ4IkCYrYURhLYW9zkRD3HrKyhNygC3ETP4aPanlvRRk500Zyg4loGK',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         });
//     return jsonDecode(response.body);
//   } catch (e) {
//     throw Exception("");
//   }
// }
//
// // Stripe amount calculate
// calculateAmountA(String amount) {
//   final a = (int.parse(amount)) * 100;
//   return a.toString();
// }

//////////////////////////
}

class NewProvider extends ChangeNotifier {




  Future<void> init() async {
    Map<String, dynamic> customer = await createCustomer();
    Map<String, dynamic> paymentIntent =
        await createPaymentIntent(customer['id']);
    log("customer::: $customer");
    log("paymentIntent ::::: $paymentIntent");
    await createCreditCard(customer['id'], paymentIntent['client_secret']);
    Map<String, dynamic> customerPaymentMethods =
        await getCustomerPaymentMethods(customer['id']);

    await createSubscription(
      customer['id'],
      customerPaymentMethods['data'][0]['id'],
    );
  }

  Future<Map<String, dynamic>> createCustomer() async {
    final customerCreationResponse = await apiService(
        endpoint: 'customers',
        requestMethod: ApiServiceMethodType.post,
        requestBody: {
          'name': ' ',
          'email': '',
          'description': 'hello'
        });

    return customerCreationResponse!;
  }

  Future<Map<String, dynamic>> createPaymentIntent(String customerId) async {
    final paymentIntentCreationResponse = await apiService(
      requestMethod: ApiServiceMethodType.post,
      endpoint: 'setup_intents',
      requestBody: {
        'customer': customerId,
        'automatic_payment_methods[enabled]': 'true',
      },
    );

    return paymentIntentCreationResponse!;
  }

  Future<void> createCreditCard(
    String customerId,
    String paymentIntentClientSecret,
  ) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        primaryButtonLabel: 'Subscribe \$10.00',
        style: ThemeMode.light,
        merchantDisplayName: 'Flutter Stripe Store Demo',
        customerId: customerId,
        setupIntentClientSecret: paymentIntentClientSecret,
      ),
    );

    await Stripe.instance.presentPaymentSheet();
  }

  Future<Map<String, dynamic>> getCustomerPaymentMethods(
    String customerId,
  ) async {
    final customerPaymentMethodsResponse = await apiService(
      endpoint: 'customers/$customerId/payment_methods',
      requestMethod: ApiServiceMethodType.get,
    );

    return customerPaymentMethodsResponse!;
  }

  Future<Map<String, dynamic>> createSubscription(
      String customerId, String paymentId) async {
    final subscriptionCreationResponse = await apiService(
        endpoint: 'subscriptions',
        requestMethod: ApiServiceMethodType.post,
        requestBody: {
          'customer': customerId,
          'items[0][price]': 'price_1ONpoNDtrRJEUyttBxiXIK1L',
          'default_payment_method': paymentId
        });
    return subscriptionCreationResponse!;
  }





}
