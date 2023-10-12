import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<String> getDeviceId() async {
  return  FirebaseAuth.instance.currentUser!.uid;
}
showSnackBar(BuildContext context, String text, bool success) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(

      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
}