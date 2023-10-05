import 'package:contactbook/provider/animation_provider/animation_provider.dart';
import 'package:contactbook/provider/auth_provider/login_provider.dart';
import 'package:contactbook/provider/auth_provider/splashscreen_provider.dart';
import 'package:contactbook/provider/dashboard_provider.dart';
import 'package:contactbook/provider/date_time_provider.dart';
import 'package:contactbook/provider/local_contact_provider.dart';
import 'package:contactbook/provider/onboarding_provider/onboarding_provider.dart';
import 'package:contactbook/provider/onboarding_provider/onboarding_provider1.dart';
import 'package:contactbook/provider/onboarding_provider/onboarding_provider2.dart';
import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:contactbook/provider/selection_provider.dart';
import 'package:contactbook/screen/auth_screen/splash_screen.dart';
import 'package:contactbook/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider/register_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => User()),
    ChangeNotifierProvider(create: (_) => LoginController()),
    ChangeNotifierProvider(create: (_) => RegisterController()),
    ChangeNotifierProvider(create: (_) => DashBoardController()),
    ChangeNotifierProvider(create: (_) => SplashScreenController()),
    ChangeNotifierProvider(create: (_) => LocalContactController()),
    ChangeNotifierProvider(create: (_) => OnBoardingCtrl()),
    ChangeNotifierProvider(create: (_) => OnBoardingCtrl1()),
    ChangeNotifierProvider(create: (_) => OnBoardingCtrl2()),
    ChangeNotifierProvider(create: (_) => SelectionProvider()),
    ChangeNotifierProvider(create: (_) => PopUpListProvider()),
    ChangeNotifierProvider(create: (_) => AnimationProvider()),
    ChangeNotifierProvider(create: (_) => DateTimeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}
