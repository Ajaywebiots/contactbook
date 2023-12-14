import 'package:contactbook/config.dart';
import 'package:contactbook/screen/auth_screen/auth_pages/login_screen.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardController extends ChangeNotifier {
  List<Contact> contacts = [];
  bool isLoading = true;
  int selectedIndex = 0;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  Future getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      // fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  Future<bool> checkPermission() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    bool isGranted = await Permission.contacts.status.isGranted;

    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
      notifyListeners();
      await preferences.setBool("isPermissionGranted", isGranted);

      return isGranted;
    } else {
      await preferences.setBool("isPermissionGranted", isGranted);
      return isGranted;
    }
  }

  Future<List<Contact>> getContacts() async {
    await FastContacts.getAllContacts().then((value) {
      for (Contact contact
          in value.where((element) => element.phones.isNotEmpty)) {
        contacts.add(contact);
      }
    });
    notifyListeners();
    return contacts;
  }

  logOutButton(context) {
    ScaffoldMessenger.of(context)
        .showSnackBar( SnackBar(content: Text(textAssets.logoutSuccess)));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const LoginScreen();
      },
    ));
  }
}
