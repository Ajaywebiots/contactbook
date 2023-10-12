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

import 'package:contactbook/common/controllers/text_common/text_common.dart';
import 'package:contactbook/common/svg_assets/svg_assets.dart';
import 'package:contactbook/provider/date_time_provider/layouts/app_array_list.dart';
import 'package:sqflite/sqflite.dart';

import 'common/theme/index.dart';

AppTheme _appTheme = AppTheme.fromType(ThemeType.light);

AppTheme get appTheme => _appTheme;
Database? db;

const bgColor = Color(0xffffc52a);
final TextCommon textCommon = TextCommon();
final SvgAssets svgAssets = SvgAssets();
final AppArray appArray = AppArray();
