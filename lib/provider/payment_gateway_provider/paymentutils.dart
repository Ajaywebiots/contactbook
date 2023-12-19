import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import '../../screen/app_screen/payment_gateway_screen/layouts/alert_dialog_common.dart';

class PaymentUtils extends ChangeNotifier {
  bool isPaymentSelected = false;

  bool isPlanSelect = false;

  TextEditingController amount = TextEditingController();

  static var publishKey =
      'pk_test_51MmTx1SHGHXeqsVlOWH2cwf42zty7jStl9ngvASN79Vri7bwGsbOSTGFTf17O2r5PiCIinh6vmO5FGrU5B2ymW7L00OcvpXwT3';
  static var secretKey =
      'sk_test_51MmTx1SHGHXeqsVlAbforUpNIqByURbQy2xKZLlDrSNUvtvbgjywaaEZfGsbcQxIh0ggazGXrfnZBy0rQSLCqvzo00PyWPfbne';



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

////////////////////////
//

  TextEditingController name = TextEditingController();
  TextEditingController cardNumCtrl = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final client = http.Client();
  bool isBack = true;

  bool isLoading = false;
  int price = 0;
  String plan = '';
  Map<String, String> headers = {
    'Authorization': 'Bearer $secretKey',
    'Content-Type': 'application/x-www-form-urlencoded'
  };





  Future<void> subscriptions(
      { priceId, context}) async {
    isLoading = true;
    notifyListeners();
    final _customer = await createCustomer();
    isLoading = true;
    notifyListeners();
    final _paymentMethod = await createPaymentMethod();
    log("_paymentMethod :: $_paymentMethod");
    if (_paymentMethod["error"] == null) {
      await attachPaymentMethod(_paymentMethod['id'], _customer['id']);
      isLoading = true;
      notifyListeners();
      await updateCustomer(_paymentMethod['id'], _customer['id']);
      isLoading = true;
      notifyListeners();
      final invoice = await createSubscriptions(_customer['id'], priceId);
      log("INVOICE ID ${invoice["latest_invoice"]}");
      isLoading = true;
      notifyListeners();
      final invoiceRes =
      await invoicePay(invoice["latest_invoice"], _paymentMethod['id']);
      log("invoiceRes ${invoiceRes["subscription"]}");
      log("_paymentMethod ${_paymentMethod["id"]}");
      isLoading = false;
      notifyListeners();
      if (invoiceRes["subscription"] != null) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialogCommon(
                image: '',
                bText1: 'okay',
                title: 'Payment Success',
                subtext: 'Congratulation',
                b1OnTap: () async {},
                crossOnTap: () {},
              );
            });
      } else {
        isLoading = false;
        notifyListeners();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialogCommon(
                  image: '',
                  bText1: "Try Again",
                  title: "Payment Failed",
                  subtext: "Due To",
                  b1OnTap: () {},
                  crossOnTap: () {});
            });
      }
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<Map<String, dynamic>> createSubscriptions(
      customerId, String priceId) async {
    const String url = 'https://api.stripe.com/v1/subscriptions';

    Map<String, dynamic> body = {
      'customer': customerId,
      'items[0][price]': priceId,
    };

    var response =
        await client.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      log("SUBSCRIPTION RES ${json.decode(response.body)}");
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to register as a subscriber.';
    }
  }

  Future<Map<String, dynamic>> createCustomer() async {
    const String url = 'https://api.stripe.com/v1/customers';
    var response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: {'description': 'new customer'},
    );
    if (response.statusCode == 200) {
      log("RESPONSEa ${json.decode(response.body)['id']}");
      log("RESPONSEa ${json.decode(response.body)}");
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to register as a customer.';
    }
  }

  Future<Map<String, dynamic>> createPaymentMethod() async {
    const String url = 'https://api.stripe.com/v1/payment_methods';
    var response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: {
        'type': 'card',
        'card[number]': cardNumCtrl.text,
        'card[exp_month]': monthController.text.substring(0, 2),
        'card[exp_year]': monthController.text.substring(3, 5),
        'card[cvc]': cvvController.text,
      },
    );
   // log('monthController${monthController.text.substring(0, 1)}'); log('monthController${monthController.text.substring(3, 5)}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      return json.decode(response.body);
    }
  }

  Future<Map<String, dynamic>> attachPaymentMethod(
      String paymentMethodId, customerId) async {
    final String url =
        'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach';
    var response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: {
        'customer': customerId,
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to attach PaymentMethod.';
    }
  }

  Future<Map<String, dynamic>> updateCustomer(
      String paymentMethodId, customerId) async {
    final String url = 'https://api.stripe.com/v1/customers/$customerId';

    var response = await client.post(Uri.parse(url),
        headers: headers,
        body: {'invoice_settings[default_payment_method]': paymentMethodId});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to update Customer.';
    }
  }


  Future<Map<String, dynamic>> invoicePay(
      String invoiceId, String paymentMethodId) async {
    String url = 'https://api.stripe.com/v1/invoices/$invoiceId/pay';
    var response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: {'payment_method': paymentMethodId},
    );
    if (response.statusCode == 200) {
      log("RESPONSE INVOICE ${json.decode(response.body)}");
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      throw 'Failed to open invoice';
    }
  }
}
