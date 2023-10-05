import 'package:contactbook/config.dart';
import 'package:contactbook/provider/auth_provider/login_provider.dart';
import 'package:contactbook/screen/auth_screen/register_screen.dart';
import 'package:contactbook/screen/app_screen/selection_screen.dart';
import 'package:contactbook/screen/services/database_model_class.dart';
import 'package:contactbook/user.dart';
import 'package:contactbook/widgets/text_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final SharedPreferences? prefs;

  const LoginScreen({super.key, this.prefs});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, value, child) {
      return Scaffold(
          backgroundColor: Colors.blue,
          body: SingleChildScrollView(
              child: Form(
                  key: value.formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 140,
                          width: double.infinity,
                          margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0))),
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Welcome",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                              Text("Login Your Account",
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(8, 80, 8, 60),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 30),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                    bottomRight: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0))),
                            child: Column(children: [
                              const SizedBox(height: 40),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFieldCommon(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        final emailRegex = RegExp(
                                            r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      hintText:
                                          "Enter Enter Valid Email ID or Phone Number",
                                      controller: value.emailCtrl)),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFieldCommon(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      final passwordRegex = RegExp(
                                          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                                      if (!passwordRegex.hasMatch(value)) {
                                        return 'Password must be at least 8 characters and include letters, numbers, and special characters';
                                      }
                                      return null;
                                    },
                                    suffixIcon: IconButton(
                                        iconSize: 20,
                                        icon: Icon(
                                            value.passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.black),
                                        onPressed: () {
                                          setState(() {
                                            value.passwordVisible =
                                                !value.passwordVisible;
                                          });
                                        }),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: value.passwordVisible,
                                    hintText: "Password",
                                    controller: value.passwordCtrl),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                  onTap: () {
                                    final isValid =
                                        value.formKey.currentState!.validate();
                                    DataBaseHelper()
                                        .loginUser(value.emailCtrl.text,
                                            value.passwordCtrl.text, db!)
                                        .then((val) async {
                                      if (!isValid) {
                                        value.formKey.currentState!.save();
                                      } else if (val.length == 1) {
                                        await value.getContact(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Login SuccessFully")));
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const SelectionScreen();
                                          // return DashBoardScreen(
                                          //   prefs: widget.prefs,
                                          // );
                                        }));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Please Check Your Email or Password")));
                                      }
                                    });
                                    Provider.of<User>(context, listen: false)
                                        .signIn(value.emailCtrl.text.toString(),
                                            value.passwordCtrl.text.toString());
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 20,
                                                bottom: 20,
                                                left: 100,
                                                right: 100),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                border: Border.all(
                                                    color: Colors.blue),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Text("login",
                                                style: TextStyle(
                                                    color: Colors.black)))
                                      ])),
                              const SizedBox(height: 40)
                            ])),
                        Container(
                            alignment: Alignment.center,
                            height: 118,
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(8, 30, 8, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                    topLeft: Radius.circular(40.0))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Create Account ?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return RegisterScreen(
                                              prefs: widget.prefs);
                                        }));
                                      },
                                      child: const Text("Register Here"))
                                ]))
                      ])))));
    });
  }
}
