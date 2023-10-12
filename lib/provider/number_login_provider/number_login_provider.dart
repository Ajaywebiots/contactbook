import 'dart:developer';
import 'package:contactbook/screen/auth_screen/number_login_screen/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NumberLoginProvider extends ChangeNotifier {
  TextEditingController countryController = TextEditingController();
  var phone = "";
  String verId = "";

  countryCtrl() {
    countryController.text = "+91";
  }

  numberTextField(value){
    phone = value;
  }



  sendTheCode(context) async {
    notifyListeners();
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 $phone',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          verId = verificationId;
          var phoneUser = FirebaseAuth.instance.currentUser;
          log("phoneUser : %$phoneUser");
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyVerify(phone, verId);
    }));
  }
}
