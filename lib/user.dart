import 'package:contactbook/screen/auth_screen/auth_pages/splash_screen.dart';
import 'package:flutter/foundation.dart';

class UserLogin with ChangeNotifier{
  String email = "";
  String password = "";

  void signIn(String emailTxt,String passwordTxt){
    email = email;
    password = password;
    SplashScreen.prefs!.setBool("loginstatus",true);
    notifyListeners();
  }
}