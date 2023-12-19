//app file


import 'package:contactbook/selection_screen.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../screen/auth_screen/auth_pages/splash_screen.dart';
import '../screen/auth_screen/number_login_screen/home_screen.dart';
import 'index.dart';


class AppRoute {

  Map<String, Widget Function(BuildContext)> route = {
    routeName.splash :(p0) => const SplashScreen(),
    routeName.splash :(p0) => const SelectionScreen(),
    routeName.homeScreen :(p0) => const HomeScreen(),
    // routeName.login :(p0) => EmailLoginScreen(),
    // routeName.loginWithPhone :(p0) => LoginWithPhoneScreen(),

  };


}
