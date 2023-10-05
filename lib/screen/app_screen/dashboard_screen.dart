import 'package:contactbook/provider/dashboard_provider.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  final SharedPreferences? prefs;

  const DashBoardScreen({super.key, this.prefs});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardController>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(title: const Text("Contact Dashboard"), actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => value.logOutButton(context)),

        ]),
        body: ListView.builder(
            itemCount: value.contacts.length,
            itemBuilder: (context, index) {
              Contact contact = value.contacts[index];
              return ListTile(
                  subtitle: Text(value.contacts[index].phones.isNotEmpty
                      ? value.contacts[index].phones[0].number
                      : "no number found"),
                  title: Text(contact.displayName));
            }),
        // floatingActionButton: FloatingActionButton(
        //     tooltip: "Add New Contact",
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(
        //         builder: (context) {
        //           return const LocalContact();
        //         },
        //       ));
        //     },
        //     child: const Icon(Icons.add))
      );
    });
  }
}
