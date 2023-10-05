import 'package:contactbook/screen/auth_screen/splash_screen.dart';
import 'package:flutter/foundation.dart';

class User with ChangeNotifier{
  String email = "";
  String password = "";

  void signIn(String emailTxt,String passwordTxt){
    email = email;
    password = password;
    SplashScreen.prefs!.setBool("loginstatus",true);
    notifyListeners();
  }
}