import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonePeProvider extends ChangeNotifier {
  String environment = "UAT_SIM";
  String appId = "";
  String merchantId = "PGTESTPAYUAT";
  bool enableLogging = true;
  String checkSum = "";
  String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  String saltIndex = "1";
  String callBackUrl =
      "https://webhook.site/f63d1195-f001-474d-acaa-f7bc4f3b20b1";
  String body = "";
  String apiEndPoint = "/pg/v1/pay";
  Object? result;

  void phonePeInit() {
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) {
      result = 'PhonePe SDK Initialized - $val';
      notifyListeners();
    }).catchError((error) {
      handleError(error);
    });
  }

  getCheckSum() {
    final requestData = {
      "merchantId": merchantId,
      "merchantTransactionId": "transaction_123",
      "merchantUserId": "90223250",
      "amount": 1000,
      "mobileNumber": "9999999999",
      "callbackUrl": callBackUrl,
      "paymentInstrument": {"type": "PAY_PAGE"}
    };

    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
    checkSum =
        '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey))}###$saltIndex';
    return base64Body;
  }

  void startPgTransaction() {
    try {
      var response = PhonePePaymentSdk.startPGTransaction(
          body, callBackUrl, checkSum, {}, apiEndPoint, "");
      response.then((val) {
        if (val != null) {
          String status = val['status'].toString();
          String error = val['error'].toString();
          if (status == 'SUCCESS') {
            result = 'Flow complete - status : SUCCESS';

          } else {
            result = 'Flow complete - status : $status and error $error';
          }
        } else {
          result = 'Flow Incomplete';
        }
      }).catchError((error) {
        handleError(error);
      });
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(error) {
    notifyListeners();
    result = {'error': error};
  }

  onInit() {
    notifyListeners();
    phonePeInit();
    body = getCheckSum().toString();
  }
}
