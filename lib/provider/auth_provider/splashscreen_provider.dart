import 'dart:developer';

import 'package:contactbook/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends ChangeNotifier {
  getContact(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isGranted = preferences.getBool("isPermissionGranted") ?? false;
    final DashBoardController dashBoardController =
        Provider.of<DashBoardController>(context, listen: false);
    log("isGranted :: $isGranted");
    if (isGranted) {
      if (dashBoardController.contacts.isEmpty) {
        dashBoardController.getContacts();
      }
    }
  }
}
