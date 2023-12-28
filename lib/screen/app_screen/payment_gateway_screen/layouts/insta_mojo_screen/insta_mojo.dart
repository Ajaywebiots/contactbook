import 'dart:developer';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/payment_gateway_provider/insta_mojo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class InstaMojo extends StatefulWidget {
  const InstaMojo({Key? key}) : super(key: key);

  @override
  State<InstaMojo> createState() => _InstaMojoState();
}

class _InstaMojoState extends State<InstaMojo> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<InstaMojoProvider>(builder: (context, instaMojoPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 60))
              .then((value) => instaMojoPvr.createRequest()),
          child: Scaffold(
              body: Center(
                  child: instaMojoPvr.isLoading
                      ? const CircularProgressIndicator()
                      : InAppWebView(
                          initialUrlRequest: URLRequest(
                              url: Uri.parse(instaMojoPvr.selectedUrl)),
                          onWebViewCreated:
                              (InAppWebViewController controller) {},
                          onProgressChanged: (InAppWebViewController controller,
                              int progress) {
                            setState(() {
                              this.progress = progress / 100;
                            });
                          },
                          onUpdateVisitedHistory:
                              (controller, uri, androidIsReload) {
                            String url = uri.toString();
                            print(uri);
                            if (mounted) {
                              if (url.contains('https://www.google.com/')) {
                                String? paymentRequestId =
                                    uri!.queryParameters['payment_id'];
                                log("value is: ${paymentRequestId!}");
                                instaMojoPvr
                                    .checkPaymentStatus(paymentRequestId);
                              }
                            }
                          }))));
    });
  }
}
