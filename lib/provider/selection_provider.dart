import 'package:contactbook/screen/app_screen/animation_demo/animation_demo.dart';
import 'package:contactbook/screen/app_screen/dashboard_screen/dashboard_screen.dart';
import 'package:contactbook/screen/app_screen/date_&_time/date_and_time_picker.dart';
import 'package:contactbook/screen/app_screen/local_contact_screen/local_contact_screen.dart';
import 'package:contactbook/screen/app_screen/filter_screen/popup_list_and_slider.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/product_list_screen.dart';
import 'package:contactbook/screen/auth_screen/number_login_screen/number_login_screen.dart';
import 'package:contactbook/screen/auth_screen/onboarding_screen/onboarding_screen.dart';
import 'package:contactbook/screen/auth_screen/onboarding_screen/onboarding_screen1.dart';
import 'package:contactbook/screen/auth_screen/onboarding_screen/onboarding_screen2.dart';
import 'package:flutter/material.dart';

class SelectionProvider extends ChangeNotifier {
  List screen = [
    const DashBoardScreen(),
    const LocalContact(),
    const OnBoardingScreen(),
    const OnBoardingScreen1(),
    const OnBoardingScreen2(),
    const PopUpList(),
    const DateTimePicker(),
    const AnimationDemo(),
    const NumberLogin(),
    const ProductListScreen()
  ];
  List screenName = [
    "Import Contact From Phone",
    "Add New Contact To Local Database",
    "Animation Screen 1",
    "Animation Screen 2",
    "Animation Screen 3",
    "PopUpList",
    "Date & Time Picker",
    "Animation demo",
    "FireBase Mobile Number Login",
    "Product Short List"
  ];

  heightMQ(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  widthMQ(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }
}
