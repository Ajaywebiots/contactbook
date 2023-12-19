//
//
// // import 'package:get/get_instance/get_instance.dart';
//
// import 'common/controllers/common_controller/app_controller.dart';
//
// var appCtrl = Get.isRegistered<AppController>()
//     ? Get.find<AppController>()
//     : Get.put(AppController());

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:contactbook/provider/loading_provider.dart';
import 'package:contactbook/screen/services/services/api_methods.dart';
import 'package:contactbook/screen/services/services/api_service.dart';
import 'package:contactbook/utils/helper/navigation_class.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'common/app_array.dart';
import 'common/app_fonts.dart';
import 'common/session.dart';
import 'common/theme/app_css.dart';
import 'common/theme/theme_service.dart';

Session session = Session();
AppFonts appFonts = AppFonts();
NavigationClass route = NavigationClass();
ApiServices apiServices = ApiServices();
AppArray appArray = AppArray();


// UserModel? userModel;
Database? db;
// Validation validation = Validation();
AppCss appCss = AppCss();
// ApiServices apiServices = ApiServices();
ApiMethods api = ApiMethods();

ThemeService appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices;
}

showLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).showLoading();
}

hideLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).hideLoading();
}

Future<bool> isNetworkConnection() async {
  var connectivityResult = await Connectivity()
      .checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    final result = await InternetAddress.lookup(
        'google.com'); //Check For Internet Connection
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
