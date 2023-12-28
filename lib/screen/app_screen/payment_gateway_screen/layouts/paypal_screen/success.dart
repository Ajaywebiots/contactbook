import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animation/animation.json'),
        ],
      ),
    );
  }
}
