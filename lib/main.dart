import 'dart:developer';
import 'package:contactbook/provider/payment_gateway_provider/flutter_wave_provider.dart';
import 'package:contactbook/provider/payment_gateway_provider/payment_gateway_provider.dart';
import 'package:contactbook/provider/payment_gateway_provider/paymentutils.dart';
import 'package:contactbook/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:contactbook/selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/theme/app_theme.dart';
import 'common/theme/theme_service.dart';
import 'provider/auth_provider/register_provider.dart';
import 'package:contactbook/provider/dashboard_provider.dart';
import 'package:contactbook/provider/selection_provider.dart';
import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:contactbook/provider/local_contact_provider.dart';
import 'provider/product_list_provider/product_list_provider.dart';
import 'package:contactbook/provider/auth_provider/login_provider.dart';
import 'package:contactbook/provider/auth_provider/splashscreen_provider.dart';
import 'package:contactbook/provider/date_time_provider/date_time_provider.dart';
import 'package:contactbook/provider/animation_provider/animation_provider.dart';
import 'package:contactbook/provider/onboarding_provider/onboarding_provider.dart';
import 'package:contactbook/provider/onboarding_provider/onboarding_provider1.dart';
import 'package:contactbook/provider/onboarding_provider/onboarding_provider2.dart';
import 'package:contactbook/screen/auth_screen/number_login_screen/firebaseApi.dart';
import 'package:contactbook/provider/number_login_provider/home_screen_provider.dart';
import 'package:contactbook/provider/number_login_provider/number_login_provider.dart';
import 'package:contactbook/provider/number_login_provider/verification_screen_provider.dart';
import 'routes/index.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationServices().initNotification();
  Stripe.publishableKey = PaymentUtils.publishKey;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapData) {
          if (snapData.hasData) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (_) => ThemeService(snapData.data!)),
                  ChangeNotifierProvider(create: (_) => UserLogin()),
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
                  ChangeNotifierProvider(create: (_) => VerificationProvider()),
                  ChangeNotifierProvider(create: (_) => NumberLoginProvider()),
                  ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
                  ChangeNotifierProvider(create: (_) => ProductListProvider()),
                  ChangeNotifierProvider(create: (_) => ThemeProvider()),
                  ChangeNotifierProvider(create: (_) => PaymentUtils()),
                  ChangeNotifierProvider(create: (_) => FlutterWaveProvider()),
                ],
                child: Consumer<ThemeService>(
                    builder: (context, theme, child) {
                      log("THEME ${theme.isDarkMode}");
                      return MaterialApp(
                          title: 'Flutter Demo',
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.fromType(ThemeType.light).themeData,
                          darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                          themeMode: theme.theme,
                          initialRoute: "/",
                          routes: appRoute.route);
                    }));
          } else {
            return MaterialApp(
                theme: AppTheme.fromType(ThemeType.light).themeData,
                darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: const SelectionScreen());
          }
        });
  }
}