import 'dart:developer';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/flutter_wave_screen/flutter_wave_screen.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/insta_mojo_screen/insta_mojo_screen.dart';
import 'package:intl/intl.dart';
import '../screen/app_screen/payment_gateway_screen/layouts/paypal_screen/paypal_screen.dart';
import '../screen/app_screen/payment_gateway_screen/layouts/phonepe_screen/phonepe_screen.dart';
import '../screen/app_screen/payment_gateway_screen/layouts/razor_pay_screen/razorpay_screen.dart';
import '../screen/app_screen/payment_gateway_screen/layouts/stripe_payment_screen/stripe_payment_screen.dart';

class AppArray {
  List paymentList = [
    {
      'paymentImage': 'assets/images/instaMojo.png',
      'navigate': InstaMojoDemo()
    },
    {
      'paymentImage': 'assets/images/flutterWave.png',
      'navigate': const FlutterWaveScreen()
    },
    {
      'paymentImage': 'assets/images/paypal.png',
      'navigate': const PayPalScreen()
    },
    {
      'paymentImage': 'assets/images/phonepe.png',
      'navigate': const PhonePePayment()
    },
    {
      'paymentImage': 'assets/images/stripe.png',
      'navigate': const StripePaymentScreen()
    },
    {
      'paymentImage': 'assets/images/razorpay.jpeg',
      'navigate': const RazorPayScreen()
    }
  ];

  List monthList = [
    {"title": "January", "index": 1},
    {"title": "February", "index": 2},
    {"title": "March", "index": 3},
    {"title": "April", "index": 4},
    {"title": "May", "index": 5},
    {"title": "June", "index": 6},
    {"title": "July", "index": 7},
    {"title": "August", "index": 8},
    {"title": "September", "index": 9},
    {"title": "October", "index": 10},
    {"title": "November", "index": 11},
    {"title": "December", "index": 12}
  ];

  List<String> hourList = List.generate(12, (index) {
    DateTime time = DateTime.now().add(Duration(hours: index));
    String formattedTime = DateFormat('hh').format(time);
    return formattedTime;
  });

  List<String> minList = List.generate(60, (index) {
    DateTime time = DateTime.now().add(Duration(minutes: index));
    String formattedTime = DateFormat('mm').format(time);
    log("$time:::::::$formattedTime");
    return formattedTime;
  });

  List<String> dayList = List.generate(2, (index) {
    DateTime time = DateTime.now().add(Duration(days: index));
    String formattedTime = DateFormat('a').format(time);
    log("$time:::::::$formattedTime");
    return formattedTime;
  });
}
