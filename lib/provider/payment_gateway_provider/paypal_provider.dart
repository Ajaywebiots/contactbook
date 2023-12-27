import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class PayPalProvider extends ChangeNotifier{
  TextEditingController amount =TextEditingController();




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

}