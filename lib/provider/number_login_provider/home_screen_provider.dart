import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactbook/selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobNoCtrl = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  var deviceUID = FirebaseAuth.instance.currentUser!.uid;


  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  logOutNavigator(context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const SelectionScreen()));
  }



}
//name device id mobno fcmtoken
