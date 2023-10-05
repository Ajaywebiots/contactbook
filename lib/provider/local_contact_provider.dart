import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config.dart';
import '../screen/auth_screen/splash_screen.dart';
import '../screen/services/database_model_class.dart';

class LocalContactController extends ChangeNotifier {
  List<Map> contactDetails = [];
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  bool isFavorite = false;
  bool IsData = false;
  List<Map> searchData = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void viewData(context) {
    int view = SplashScreen.prefs!.getInt("userid") ?? 0;

    final LocalContactController homePageCtrl =
        Provider.of<LocalContactController>(context, listen: false);
    DataBaseHelper().contactView(view, db!).then((value) async {
      homePageCtrl.contactDetails = value;
      homePageCtrl.searchData = value;
      homePageCtrl.IsData = true;
      await Future.delayed(const Duration(seconds: 1));

      notifyListeners();
    });
  }

  // addContact(homePageCtrl, context) {
  //   int user = SplashScreen.prefs!.getInt("userid") ?? 0;
  //   DataBaseHelper()
  //       .insertContact(
  //           homePageCtrl.name.text, homePageCtrl.number.text, user, db!)
  //       .then((value) {
  //     homePageCtrl.viewData(context);
  //   });
  //   homePageCtrl.name.text = "";
  //   homePageCtrl.number.text = "";
  //   Navigator.pop(context);
  // }
}
