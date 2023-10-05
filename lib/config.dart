//
//
// // import 'package:get/get_instance/get_instance.dart';
//
// import 'common/controllers/common_controller/app_controller.dart';
//
// var appCtrl = Get.isRegistered<AppController>()
//     ? Get.find<AppController>()
//     : Get.put(AppController());

import 'dart:ui';

import 'package:sqflite/sqflite.dart';

import 'common/theme/index.dart';

AppTheme _appTheme = AppTheme.fromType(ThemeType.light);

AppTheme get appTheme => _appTheme;
Database? db;

const bgColor = Color(0xffffc52a);