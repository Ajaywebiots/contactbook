import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> createOrderId() async {
  final myData = await CallOrderApi().api();
  log("myDataCreate: $myData");
  if (myData["status"] == "success") {
    log(myData.toString());
    return myData["body"];
  } else {
    return {"error": "error"};
  }
}

class CallOrderApi {
  api() async {
    var header = {
      'content-type': 'application/json',
      'Authorization':
          'Basic ${base64Encode(utf8.encode('rzp_test_MSRXAX2QuYl13C : 8u7d6aUGgjCYVr4gFALgyng4'))}'
    };
    var request =
        http.Request('POST', Uri.parse('https://api.razorpay.com/v1/orders'));
    request.body = json.encode({
      "amount": 300 * 100,
      "currency": "INR",
      "receipt": "01",
      "notes": {"notes_key_1": "afa", "notes_key_2": "dadsda"}
    });
    request.headers.addAll(header);

    log("Step 4: Sending request to Razorpay API...");
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log("Step 5: Razorpay API response received successfully.");
      return {
        "status": "success",
        "body": jsonDecode(await response.stream.bytesToString())
      };
    } else {
      log("Step 5: Razorpay API response failed. Error: ${response.reasonPhrase}");
      return {"status": "payment fail", "message": response.reasonPhrase};
    }
  }
}
