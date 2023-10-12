import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactbook/provider/number_login_provider/home_screen_provider.dart';
import 'package:contactbook/screen/app_screen/chat_screen/chat_user.dart';
import 'package:contactbook/screen/auth_screen/number_login_screen/demo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  ChatUser? chatUser;
  FirebaseMessaging? firebaseMessaging;
  String fcmToken = "";

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        fcmToken = token ?? "";
        debugPrint("FCM Token: $fcmToken");
      });
    });
  }

  /* Future<void> authListener() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.androidInfo;
      final deviceId = deviceInfo.id;

      final ref = FirebaseFirestore.instance.collection('users');

      final userDoc = await ref.doc(user.uid).get();
      if (userDoc.exists) {
        final userDeviceId = userDoc.get('deviceId');

        if (userDeviceId != deviceId) {
          await FirebaseAuth.instance.signOut();
          // ignore: use_build_context_synchronously
          showSnackBar(context, 'Your account logged in another device', false);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const NumberLogin()));
          setState(() {});
        }
      }
    } catch (e) {}
  }*/

  /*Future<void> authListener() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.androidInfo;
      final deviceId = deviceInfo.id;
      final ref = FirebaseFirestore.instance.collection('users/deviceId');
      log("reffff :: ${deviceId}");
      setState(() {});
      ref.limit(1).snapshots().listen((event) async {
        if (event.docs.isNotEmpty) {
          if (event.docs[0].data()['deviceId'] != deviceId) {
            await logout(true);
            setState(() {});
          }
        }
      });
     */ /*ref.listen((event) async {
        if (event.snapshot.value != null) {
          final value = event.snapshot.value as Map<dynamic, dynamic>;

          // Check if the same id, if not same then logout and navigate to login screen
          if (value['deviceId'] != deviceId) {
            await logout(true);
          }
        }
      });*/ /*
    } catch (e) {
      //
    }
  }*/

  /* Future<void> logout(bool isShowSnackBar) async {
    await FirebaseAuth.instance.signOut();

    if (isShowSnackBar) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Your account logged in another device', false);
    }

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const NumberLogin()));
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Scaffold(
          backgroundColor: Colors.green.shade200,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.green.shade200,
              actions: [
                IconButton(
                    onPressed: () => homeScreenPvr.signOut().then(
                        (value) => homeScreenPvr.logOutNavigator(context)),
                    icon: const Icon(Icons.logout))
              ]),
          body: StreamBuilder(
              stream: usersStream,
              builder: (context, snapshot) {
                // final list = [];
                // if (snapshot.hasData) {
                //   final data = snapshot.data?.docs;
                //   for (var i in data!) {
                //     log("data : ${data[0].data()}");
                //     list.add(i.data());
                //     log("list $list");
                //   }
                // }
                if (snapshot.hasError) {
                  return const Text("Something is wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                          final userDetails =
                              snapshot.data!.docChanges[index].doc;
                          // final userData = snapshot.data!.docs[index].data()
                          //     as Map<String, dynamic>;
                          return GestureDetector(
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return ChatScreen(userDetails);
                                // }));
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ChatScreen11(userData: userDetails,);
                                  },
                                ));
                              },
                              child: Column(children: [
                                const SizedBox(height: 4),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: ListTile(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: Colors.black)),
                                        title: Text(userDetails['name'],
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        subtitle: Text(userDetails['number'],
                                            style:
                                                const TextStyle(fontSize: 15)),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16)))
                              ]));
                        }));
              }));
    });
  }
}
