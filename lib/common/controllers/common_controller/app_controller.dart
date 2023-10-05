

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../theme/app_theme.dart';

class AppController extends ChangeNotifier {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  final storage = SharedPreferences.getInstance();

  Database? db;
  AppTheme get appTheme => _appTheme;


  //update theme
 /* updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }*/

  //get storage data
  /*getStorageData(){

    bool isAdmin = appCtrl.storage.read("isSignIn") ?? false;
    appCtrl.isLogged = isAdmin;
     log("isLogin;  $isAdmin");

    bool isTheme = appCtrl.storage.read(session.isDarkMode) ?? false;
    log("isTheme : $isTheme");
    update();
    appCtrl.isTheme = isTheme;
    ThemeService().switchTheme(appCtrl.isTheme);
    appCtrl.update();


    appCtrl.languageVal = appCtrl.storage.read(session.languageCode) ?? "en";
    log("language : ${appCtrl.languageVal}");
    if (appCtrl.languageVal == "en") {
      var locale = const Locale("en", 'US');
      Get.updateLocale(locale);
    } else if (appCtrl.languageVal == "ar") {
      var locale = const Locale("ar", 'AE');
      Get.updateLocale(locale);
    } else if (appCtrl.languageVal == "hi") {
      var locale = const Locale("hi", 'IN');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
    } else {

      var locale = const Locale("ko", 'KR');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
    }
    update();

  }*/
}

