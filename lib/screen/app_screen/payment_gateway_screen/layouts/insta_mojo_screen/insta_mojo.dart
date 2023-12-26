import 'dart:developer';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/payment_gateway_provider/insta_mojo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class InstaMojo extends StatefulWidget {
  const InstaMojo({super.key});

  @override
  State<InstaMojo> createState() => _InstaMojoState();
}

class _InstaMojoState extends State<InstaMojo> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<InstaMojoProvider>(builder: (context, instaMojoPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 100))
              .then((value) => instaMojoPvr.createRequest()),
          child: Scaffold(
              body: Center(
                  child: instaMojoPvr.isLoading
                      ? //check Loading status
                      const CircularProgressIndicator() //if true
                      : InAppWebView(
                          initialUrlRequest: URLRequest(
                              url: Uri.tryParse(instaMojoPvr.selectedUrl!)),
                          onWebViewCreated:
                              (InAppWebViewController controller) {},
                          onProgressChanged:
                              (InAppWebViewController controller, s) {
                            this.progress = s / 100;
                          },
                          onUpdateVisitedHistory:
                              (controller, uri, androidIsReload) {
                            String url = uri.toString();
                            print(uri);
                            // uri contains newly loaded url
                            if (mounted) {
                              if (url.contains('https://www.google.com/')) {
                                //Take the payment_id parameter of the url.
                                String? paymentRequestId =
                                    uri!.queryParameters['payment_id'];
                                log("value is: ${paymentRequestId!}");
                                //calling this method to check payment status
                                instaMojoPvr
                                    .checkPaymentStatus(paymentRequestId);
                              }
                            }
                          }))));
    });
  }
}
