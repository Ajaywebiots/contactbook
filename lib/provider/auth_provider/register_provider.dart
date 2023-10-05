import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  TextEditingController passwordTxt = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  String? emailValid, passwordValid;
}
