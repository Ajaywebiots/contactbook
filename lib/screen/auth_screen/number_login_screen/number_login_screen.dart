import 'package:contactbook/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/provider/number_login_provider/number_login_provider.dart';

class NumberLogin extends StatefulWidget {
  const NumberLogin({Key? key}) : super(key: key);

  @override
  State<NumberLogin> createState() => _NumberLoginState();
}

class _NumberLoginState extends State<NumberLogin> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberLoginProvider>(
        builder: (context, numberLoginPvr, child) {
      return Scaffold(
          body: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const SizedBox(height: 25),
                    Text(textCommon.phoneVerification,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(textCommon.weNeedToRegister,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 30),
                    Container(
                        height: 55,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: TextField(
                                      maxLength: 10,
                                      onChanged: (value) =>
                                          numberLoginPvr.numberTextField(value),
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          counterText: "",
                                          border: InputBorder.none,
                                          hintText: textCommon.phone)))
                            ])),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade600,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () =>
                                numberLoginPvr.sendTheCode(context),
                            child: Text(textCommon.sendTheCode)))
                  ]))));
    });
  }
}
