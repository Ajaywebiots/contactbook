import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactbook/screen/auth_screen/number_login_screen/home_screen.dart';
import 'package:contactbook/widgets/text_common_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class VerificationProvider extends ChangeNotifier {
  TextEditingController otp = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String phone = "";
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  verifyPhoneNum(context, widget) async {
    log("widget.verId : ${widget.verId}");
    log("widget.verId : ${otp.text.toString()}");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verId, smsCode: otp.text.toString());
    await auth.signInWithCredential(credential).then((value) {
      /*Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));*/
      phoneCtrl.text = value.user!.phoneNumber!;
      showDialogBoxForSave(context);
    });
  }

  showDialogBoxForSave(context) {
    showDialog(
        context: context,
        builder: (context1) {
          return SimpleDialog(title: const Text("Add Details"), children: [
            const SizedBox(height: 10),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFieldCommon(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                    },
                    keyboardType: TextInputType.name,
                    hintText: "Enter Name",
                    controller: nameCtrl)),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFieldCommon(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Number';
                      }
                    },
                    keyboardType: TextInputType.number,
                    hintText: "Enter Number",
                    controller: phoneCtrl)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    FirebaseMessaging.instance.getToken().then((token) async {
                      final deviceInfoPlugin = DeviceInfoPlugin();
                      final deviceInfo = await deviceInfoPlugin.androidInfo;
                      final deviceId = deviceInfo.id;
                      log("phoneCtrl : ${phoneCtrl.text}");
                      log("deviceInfo : $deviceId");
                      ref
                          .where('number', isEqualTo: phoneCtrl.text)
                          .limit(1)
                          .get()
                          .then((value) {
                        log("value.docs.isEmpty::::${value.docs.isEmpty}");
                        if (value.docs.isEmpty) {
                          ref.add({
                            'name': nameCtrl.text,
                            'number': phoneCtrl.text,
                            'deviceId': deviceId,
                            'fcmToken': token
                          });
                        } else {
                          ref.doc(value.docs[0].id).update({
                            'name': nameCtrl.text,
                            'number': phoneCtrl.text,
                            'deviceId': deviceId,
                            'fcmToken': token
                          });
                          /*   ref.doc({
                            'name': nameCtrl.text,
                            'number': phoneCtrl.text,
                            'deviceId': deviceId,
                            'fcmToken': token
                          });*/
                        }
                      });

                      Navigator.pop(context);
                    }).then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                    });
                  },
                  child: const Text("Save Data")),
            ])
          ]);
        });
  }
}
