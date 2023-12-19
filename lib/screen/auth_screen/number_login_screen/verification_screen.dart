import 'package:contactbook/config.dart';
import 'package:contactbook/provider/number_login_provider/verification_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyVerify extends StatefulWidget {
  final String number;
  final String verId;

  const MyVerify(this.number, this.verId, {super.key});

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VerificationProvider>(
        builder: (context, verificationPvr, child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.black))),
          body: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const SizedBox(height: 25),
                    Text(appFonts.phoneVerification,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: 140,
                        child: TextField(
                            controller: verificationPvr.otp,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 6,
                            style: const TextStyle(fontSize: 30),
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: appFonts.dash,
                                hintStyle: const TextStyle(fontSize: 30)))),
                    const SizedBox(height: 30),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade600,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () =>
                                verificationPvr.verifyPhoneNum(context, widget),
                            child: Text(appFonts.verifyPhoneNum)))
                  ]))));
    });
  }
}
