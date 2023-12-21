import 'dart:developer';
import 'package:contactbook/provider/auth_provider/splashscreen_provider.dart';
import 'package:contactbook/selection_screen.dart';
import 'package:contactbook/screen/auth_screen/auth_pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contactbook/config.dart';

import '../../../services/database_model_class.dart';

class SplashScreen extends StatefulWidget {
  static SharedPreferences? prefs;

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenController>(builder: (context, value, child) {
      value.getContact(context);
      return Scaffold(
          backgroundColor: Colors.blue,
          body: Center(child: Lottie.asset("assets/animation/contacts.json")));
    });
  }

  Future<void> forGetData() async {
    SplashScreen.prefs = await SharedPreferences.getInstance();

    isLogin = SplashScreen.prefs!.getBool("loginstatus") ?? false;

    DataBaseHelper().getDatabase().then((value) {
      setState(() {
        db = value;
      });

      log("db :$db");
    });
    Future.delayed(const Duration(seconds: 4)).then((value) {
      if (isLogin) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const SelectionScreen();
          },
        ));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return LoginScreen(
              prefs: SplashScreen.prefs,
            );
          },
        ));
      }
    });
  }
}
