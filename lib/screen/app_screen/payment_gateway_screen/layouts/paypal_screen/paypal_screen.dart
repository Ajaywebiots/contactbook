import 'dart:convert';
import 'dart:developer';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/payment_gateway_provider/paypal_provider.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/paypal_screen/paypal_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PayPalScreen extends StatefulWidget {
  const PayPalScreen({super.key});

  @override
  State<PayPalScreen> createState() => _PayPalScreenState();
}

class _PayPalScreenState extends State<PayPalScreen> {
  void launchWebView(String url) {
    launch(url);
  }

  Future<String> getPayPalAccessToken() async {
    String clientId =
        'AWSvIg3u2s-p7g2RYkcktJLjtn3Rsw0LZAm0CoS6WeYtEoYmSzRC01bT0wVxz4whG3eN4bCu1vparBbp';
    String secret =
        'EPtAGaQiNig5iYMuxtoFs_kVimBODw7axl7hSjn21YLPi6aCRJymPoU2n9GtLWNVqXGWj155XRK7Kpcm';

    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$clientId:$secret'))}';

    var response = await http.post(
        Uri.parse(
            'https://api.sandbox.paypal.com/v1/oauth2/token?grant_type=client_credentials'),
        headers: <String, String>{
          'Authorization': basicAuth,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          'grant_type': 'client_credentials'
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PayPalProvider>(builder: (context, payPalPvr, child) {
      return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            child: const Text('Call'),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
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
                      print('cancelled:');
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
                    note: "Contact us for any questions on your order.")))

            // Container(
            //     margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            //     child: TextFormField(
            //         controller: payPalPvr.amount,
            //         textInputAction: TextInputAction.next,
            //         keyboardType: TextInputType.number,
            //         style: const TextStyle(color: Colors.black),
            //         decoration: const InputDecoration(hintText: "Amount"),
            //         validator: (value) => value != null && value.isNotEmpty
            //             ? null
            //             : "Amount is required")),
            )
      ]));
    });
  }
}

class PaypalCheckoutView extends StatefulWidget {
  final Function onSuccess, onCancel, onError;
  final String? note, clientId, secretKey;

  final Widget? loadingIndicator;
  final List? transactions;
  final bool? sandboxMode;

  const PaypalCheckoutView({
    Key? key,
    required this.onSuccess,
    required this.onError,
    required this.onCancel,
    required this.transactions,
    required this.clientId,
    required this.secretKey,
    this.sandboxMode = false,
    this.note = '',
    this.loadingIndicator,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaypalCheckoutViewState();
  }
}

class PaypalCheckoutViewState extends State<PaypalCheckoutView> {
  String? checkoutUrl;
  String navUrl = '';
  String executeUrl = '';
  String accessToken = '';
  bool loading = true;
  bool pageloading = true;
  bool loadingError = false;
  late PaypalServices services;
  int pressed = 0;
  double progress = 0;
  final String returnURL =
      'https://www.youtube.com/channel/UC9a1yj1xV2zeyiFPZ1gGYGw';
  final String cancelURL = 'https://www.facebook.com/tharwat.samy.9';

  late InAppWebViewController webView;

  Map getOrderParams() {
    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": widget.transactions,
      "note_to_payer": widget.note,
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }

  @override
  void initState() {
    services = PaypalServices(
      sandboxMode: widget.sandboxMode!,
      clientId: widget.clientId!,
      secretKey: widget.secretKey!,
    );

    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        Map getToken = await services.getAccessToken();

        if (getToken['token'] != null) {
          accessToken = getToken['token'];
          final body = getOrderParams();
          final res = await services.createPaypalPayment(body, accessToken);

          if (res["approvalUrl"] != null) {
            setState(() {
              checkoutUrl = res["approvalUrl"];
              executeUrl = res["executeUrl"];
            });
          } else {
            widget.onError(res);
          }
        } else {
          widget.onError("${getToken['message']}");
        }
      } catch (e) {
        widget.onError(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Paypal Payment",
          ),
        ),
        body: Stack(
          children: <Widget>[
            InAppWebView(
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final url = navigationAction.request.url;

                if (url.toString().contains(returnURL)) {
                  exceutePayment(url, context);
                  return NavigationActionPolicy.CANCEL;
                }
                if (url.toString().contains(cancelURL)) {
                  return NavigationActionPolicy.CANCEL;
                } else {
                  return NavigationActionPolicy.ALLOW;
                }
              },
              initialUrlRequest: URLRequest(url: Uri.parse(checkoutUrl!)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onCloseWindow: (InAppWebViewController controller) {
                widget.onCancel();
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
            progress < 1
                ? SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                      value: progress,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Paypal Payment",
          ),
        ),
        body: Center(
            child:
                widget.loadingIndicator ?? const CircularProgressIndicator()),
      );
    }
  }

  void exceutePayment(Uri? url, BuildContext context) {
    final payerID = url!.queryParameters['PayerID'];
    if (payerID != null) {
      services.executePayment(executeUrl, payerID, accessToken).then(
        (id) {
          if (id['error'] == false) {
            widget.onSuccess(id);
          } else {
            widget.onError(id);
          }
        },
      );
    } else {
      widget.onError('Something went wront PayerID == null');
    }
  }
}
