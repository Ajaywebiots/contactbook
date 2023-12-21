import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class InstaMojoProvider extends ChangeNotifier {
  String? selectedUrl;

  bool isLoading = true; //this can be declared outside the class
  TextEditingController buyerName = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  checkPaymentStatus(String id) async {
    var response = await http.get(
        Uri.parse("https://test.instamojo.com/api/1.1/payments/$id/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "X-Api-Key": "test_b678a7048c8a9e5f69663c2e4fa",
          "X-Auth-Token": "test_41af76995b230611b2c3b72b8cc"
        });
    var realResponse = json.decode(response.body);
    print(realResponse);
    if (realResponse['success'] == true) {
      if (realResponse["payment"]['status'] == 'Credit') {
        print('sucesssssssssssful');
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //         builder: (context) => ()));
//payment is successful.
      } else {
        print('failed');
//payment failed or pending.
      }
    } else {
      print("PAYMENT STATUS FAILED");
    }
  }

  Future createRequest() async {
    Map<String, String> body = {
      "amount": amount.text, //amount to be paid
      "purpose": "Buy a Product",
      "buyer_name": "ajay",
      "email": 'xyz@gmail.com',
      "phone": '9996665236',
      "allow_repeated_payments": "true",
      "send_email": "true",
      "send_sms": "true",
      "redirect_url": "",
      //Where to redirect after a successful payment.
      "webhook": "",
    };
//First we have to create a Payment_Request.
//then we'll take the response of our request.
    var resp = await http.post(
        Uri.parse("https://test.instamojo.com/api/1.1/payment-requests/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "X-Api-Key": "test_b678a7048c8a9e5f69663c2e4fa",
          "X-Auth-Token": "test_41af76995b230611b2c3b72b8cc"
        },
        body: body);
    log("resp ${resp.body}");
    log("resp ${resp.request}");
    if (json.decode(resp.body)['success'] == true) {
//If request is successful take the longurl.
      notifyListeners();
      isLoading = false; //setting state to false after data loaded

      selectedUrl =
          "${json.decode(resp.body)["payment_request"]['longurl']}?embed=form";

      log(json.decode(resp.body)['message'].toString());
//If something is wrong with the data we provided to
//create the Payment_Request. For Example, the email is in incorrect format, the payment_Request creation will fail.
    }
  }


}
