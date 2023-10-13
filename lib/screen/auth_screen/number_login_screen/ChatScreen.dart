import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactbook/screen/auth_screen/number_login_screen/demo.dart';
import 'package:contactbook/screen/auth_screen/number_login_screen/firebaseApi.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final userData;

  const ChatScreen({
    super.key,
    this.userData,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  NotificationServices notificationServices = NotificationServices();

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String messageText;
  final Stream<QuerySnapshot> messageStream =
      FirebaseFirestore.instance.collection('messages').snapshots();
  String tokenKey =
      "AAAAz8KrN_g:APA91bGIRnkNoLEK2ZgGzyRJvvaRApCrlh3OvIbBfN4RlWR3RdXxRHKjAHlBpZJk0_XmFncBxLheTLByv_EPgNh7rMItt2BDk1KHwufzYlv11B8FdydrBefPO8cn_5evgLcfCSjGxVuX";

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      log("$e");
    }
  }

  notificationAlert() async {

    log("value flutter api:::${widget.userData}");

    final data = {
      "notification": {
        "body": messageText,
        "title": widget.userData["name"],
      },
      "to": widget.userData["fcmToken"],
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "alertMessage": 'true',
        "title": "Chat Message",
        "pId": loggedInUser.uid,
        "pName": loggedInUser.displayName,
      },
    };
    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=$tokenKey'
    };

    BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: headers);

    try {
      final response = await Dio(options)
          .post('https://fcm.googleapis.com/fcm/send', data: data);
      log("data  $data");

      if (response.statusCode == 200) {
        log('Alert push notification send ');
      } else {
        log('notification sending failed');
        // on failure do sth
      }
    } catch (e) {
      log('exception $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.userData['name']),
            backgroundColor: Colors.green.shade200),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              StreamBuilder(
                  stream: messageStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      List<QueryDocumentSnapshot<Object?>> message =
                          snapshot.data!.docs;

                      log("snapshot.data!.docs :${snapshot.data!.docs}");
                      List<MessageBubble> messages = [];

                      snapshot.data!.docs.asMap().entries.forEach((element) {
                        dynamic newData = element.value.data();

                        messages.add(MessageBubble(
                            messageTxt: newData['text'],
                            messageSender: newData['sender'] ?? "",
                            isMe: newData['sender'] == loggedInUser.phoneNumber
                                ? true
                                : false));
                      });
                      return Expanded(
                          child: ListView(reverse: true, children: messages));
                    }
                  }),
              Container(
                  decoration: kMessageContainerDecoration,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                                controller: messageTextController,
                                onChanged: (value) {
                                  messageText = value;
                                },
                                decoration: kMessageTextFieldDecoration)),
                        TextButton(
                            onPressed: () {
                              messageTextController.clear();
                              _firestore.collection('messages').add({
                                'text': messageText,
                                'sender': loggedInUser.phoneNumber,
                                'createdAt': DateTime.now()
                              });
                              setState(() {
                                notificationAlert();
                              });
                            },
                            child: Text('Send', style: kSendButtonTextStyle))
                      ]))
            ])));
  }
}

class MessageBubble extends StatelessWidget {
  final String messageTxt;
  final String messageSender;
  final bool isMe;

  const MessageBubble(
      {Key? key,
      required this.messageTxt,
      required this.messageSender,
      required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(messageSender,
              style: const TextStyle(color: Colors.black54, fontSize: 12)),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.only(
                      topLeft: isMe
                          ? const Radius.circular(30.0)
                          : const Radius.circular(0),
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0),
                      topRight: isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(30)),
                  color: isMe ? Colors.green.shade200 : Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(messageTxt,
                          style: TextStyle(
                              fontSize: 20,
                              color: isMe ? Colors.white : Colors.black54)))))
        ]);
  }
}
