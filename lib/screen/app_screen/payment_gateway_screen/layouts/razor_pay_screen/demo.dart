import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

var razorpayApiKey = 'rzp_test_MSRXAX2QuYl13C';
var razorpaySecretKey = '8u7d6aUGgjCYVr4gFALgyng4';

createOrder() async {
  final myData = await ApiServices().razorPayApi();
  log("myDataCreate: $myData");
  if (myData["status"] == "success") {
    log('kasdjhfgkadfg ${myData.toString()}');
    return myData["body"]["id"];
  } else {
    return "err";
  }
}

class ApiServices {
  razorPayApi() async {
    var auth =
        'Basic ${base64Encode(utf8.encode('rzp_test_MSRXAX2QuYl13C:8u7d6aUGgjCYVr4gFALgyng4'))}';
    var headers = {'content-type': 'application/json', 'Authorization': auth};
    var request =
        http.Request('POST', Uri.parse('https://api.razorpay.com/v1/orders'));
    request.body = json.encode({
      "amount": 100 * 100, // Amount in smallest unit like in paise for INR
      "currency": "INR", //Currency
      "receipt": "0001" //R
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (response.headers.toString().contains("application/json")) {
        return {
          "status": "success",
          "body": jsonDecode(await response.stream.bytesToString())
        };
      } else {
        return {"status": "fail", "message": (response.reasonPhrase)};
      }
    }
  }
}
