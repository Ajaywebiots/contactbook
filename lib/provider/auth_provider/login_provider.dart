import 'package:contactbook/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  bool passwordVisible = false;
  String? emailValid, passwordValid;

  getContact(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isGranted = preferences.getBool("isPermissionGranted") ?? false;
    final DashBoardController dashBoardController =

    Provider.of<DashBoardController>(context, listen: false);
    if (isGranted) {
      if(dashBoardController.contacts.isEmpty){
        dashBoardController.getContacts();
      }
    }else{
      dashBoardController.checkPermission().then((value) {
        if(value){
          if(dashBoardController.contacts.isEmpty){
            dashBoardController.getContacts();
          }
        }
      });
    }
  }
}
