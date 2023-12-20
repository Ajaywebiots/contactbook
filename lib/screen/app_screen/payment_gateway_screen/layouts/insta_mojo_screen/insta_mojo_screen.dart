// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';
//
// const kAndroidUserAgent =
//     "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36";
//
// Future createRequest() async {
//   Map<String, String> body = {
//     "amount": "100", //amount to be paid
//     "purpose": "Advertising",
//     "buyer_name": 'name',
//     "email": 'email',
//     "phone": 'phone',
//     "allow_repeated_payments": "true",
//     "send_email": "false",
//     "send_sms": "false",
//     "redirect_url": "http://www.example.com/redirect/",
//     //Where to redirect after a successful payment.
//     "webhook": "http://www.example.com/webhook/",
//   };
// //First we have to create a Payment_Request.
// //then we'll take the response of our request.
//   var resp = await http.post(
//       Uri.parse("https://test.instamojo.com/api/1.1/payment-requests/"),
//       headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/x-www-form-urlencoded",
//         "X-Api-Key": "test_AeNrAvbO045XXQvwyCJIsPGYLgF5w7qPv9d",
//         "X-Auth-Token":
//             "test_v4PGHFHhhnHj8beyqME4y15uvfGmHtFHlis3breJChZgzCIUqvW1idwwEgarNfh4ZAnfINbuxfeNsc0b4K0PPwiy9Ga6U2px5ChBeSskksY4vMceiyvRPbL6Mla"
//       },
//       body: body);
//   if (json.decode(resp.body)['success'] == true) {
// //If request is successful take the longurl.
// //     String selectedUrl = json.decode(resp.body)["payment_request"['longurl'].toString() + "?embed=form"];
// //     flutterWebviewPlugin.close();
// //Let's open the url in webview.
// //     flutterWebviewPlugin.launch(selectedUrl,
// //         rect: new Rect.fromLTRB(
// //             5.0,
// //             MediaQuery.of(context).size.height / 7,
// //             MediaQuery.of(context).size.width - 5.0,
// //             7 * MediaQuery.of(context).size.height / 7),
// //         userAgent: kAndroidUserAgent
// //     );
//   } else {
//     // _showSnackbar(json.decode(resp.body)['message'].toString());
// //If something is wrong with the data we provided to
// //create the Payment_Request. For Example, the email is in incorrect format, the payment_Request creation will fail.
//   }
//
//   log("message  ::: ${resp.body}");
// }
//
// checkPaymentStatus(String id) async {
//   var response = await http.get(
//       Uri.parse("https://t7+st.instamojo.com/api/1.1/payments/$id/"),
//       headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/x-www-form-urlencoded",
//         "X-Api-Key": "test_AeNrAvbO045XXQvwyCJIsPGYLgF5w7qPv9d",
//         "X-Auth-Token": "test_v4PGHFHhhnHj8beyqME4y15uvfGmHtFHlis3breJChZgzCIUqvW1idwwEgarNfh4ZAnfINbuxfeNsc0b4K0PPwiy9Ga6U2px5ChBeSskksY4vMceiyvRPbL6Mla"
//       });
//   var realResponse = json.decode(response.body);
//   print('aldjsalkdjs$realResponse');
//   if (realResponse['success'] == true) {
//     if (realResponse["payment"]['status'] == 'Credit') {
//     } else {}
//   } else {
//     print("PAYMENT STATUS FAILED");
//   }
// }
//
//
// class InstaMojoScreen extends StatefulWidget {
//   const InstaMojoScreen({super.key});
//
//   @override
//   State<InstaMojoScreen> createState() => _InstaMojoScreenState();
// }
//
// class _InstaMojoScreenState extends State<InstaMojoScreen> {
//   @override
//   void initState() {
//     super.initState();
//     createRequest();
//     WebView(initialUrl: ,)
//     checkPaymentStatus();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//
//       ]),
//     );
//   }
// }
