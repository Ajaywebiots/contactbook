import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class InstaMojoProvider extends ChangeNotifier {
  late String selectedUrl;
  bool isLoading = true;
  TextEditingController amount = TextEditingController();

  checkPaymentStatus(String id) async {
    try {
      var response = await http.get(
        Uri.parse("https://test.instamojo.com/api/1.1/payments/$id/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "X-Api-Key": "test_b678a7048c8a9e5f69663c2e4fa",
          "X-Auth-Token": "test_41af76995b230611b2c3b72b8cc",
        },
      );
      var realResponse = json.decode(response.body);
      print(realResponse);
      if (realResponse['success'] == true) {
        if (realResponse["payment"]['status'] == 'Credit') {
          print('Successful payment');
        } else {
          print('Payment failed or pending');
        }
      } else {
        print("PAYMENT STATUS FAILED");
      }
    } catch (e) {
      print("Error checking payment status: $e");
    }
  }

  Future<void> createRequest() async {
    try {
      Map<String, String> body = {
        "amount": "9",
        "purpose": "Advertising",
        "buyer_name": 'mahesh',
        "email": 'abc@gmail.com',
        "phone": '7276544474',
        "allow_repeated_payments": "true",
        "send_email": "true",
        "send_sms": "true",
        "redirect_url": "https://www.google.com/",
        "webhook": "https://www.google.com/",
      };

      var resp = await http.post(
        Uri.parse("https://test.instamojo.com/api/1.1/payment-requests/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "X-Api-Key": "test_b678a7048c8a9e5f69663c2e4fa",
          "X-Auth-Token": "test_41af76995b230611b2c3b72b8cc",
        },
        body: body,
      );
      log("resp ${resp.body}");
      log("resp ${resp.request}");

      if (json.decode(resp.body)['success'] == true) {
        notifyListeners();
        isLoading = false;
        notifyListeners();
        selectedUrl =
            json.decode(resp.body)["payment_request"]['longurl'].toString() + "?embed=form";
        notifyListeners();
        print(json.decode(resp.body)['message'].toString());
      }
    } catch (e) {
      print("Error creating payment request: $e");
    }
  }
}
