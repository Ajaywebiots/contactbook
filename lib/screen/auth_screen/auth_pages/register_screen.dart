import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:contactbook/provider/auth_provider/register_provider.dart';
import 'package:contactbook/screen/auth_screen/auth_pages/login_screen.dart';
import 'package:contactbook/screen/services/database_model_class.dart';
import 'package:contactbook/widgets/text_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contactbook/config.dart';

class RegisterScreen extends StatefulWidget {
  final SharedPreferences? prefs;

  const RegisterScreen({super.key, this.prefs});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(builder: (context, value, _) {
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
                                  Text("Register Your Account",
                                      style: TextStyle(fontSize: 18))
                                ])),
                        Container(
                            margin: const EdgeInsets.fromLTRB(8, 80, 8, 80),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 40, bottom: 40),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                    bottomRight: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: TextFieldCommon(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Your Email';
                                            }
                                            final emailRegex = RegExp(
                                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                                            if (!emailRegex.hasMatch(value)) {
                                              return 'Please Enter A Valid Email Address';
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          hintText: "Enter Your Email ID",
                                          controller: value.emailTxt)),
                                  const SizedBox(height: 20),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: IntlPhoneField(
                                          invalidNumberMessage:
                                              "Please Enter Valid Phone Number",
                                          validator: (p0) {
                                            if (p0!.number.isEmpty) {
                                              return 'Please Enter Your Number';
                                            }
                                            return null;
                                          },
                                          controller: value.phoneTxt,
                                          keyboardType: TextInputType.number,
                                          style: AppCss1.dmSansExtraBold16
                                              .textColor(Colors.black),
                                          decoration: InputDecoration(
                                            hintStyle: AppCss1.dmSansExtraBold16
                                                .textColor(
                                                    const Color(0xff767676)),
                                            counterText: "",
                                            hintText: 'Phone Number',
                                            border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        AppRadius.r10)),
                                                borderSide: BorderSide()),
                                            disabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            AppRadius.r10))),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      AppRadius.r10)),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      AppRadius.r10)),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 25),
                                          ),
                                          initialCountryCode: 'IN',
                                          onChanged: (phone) {})),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: TextFieldCommon(
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
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Your Password';
                                            }
                                            final passwordRegex = RegExp(
                                                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                                            if (!passwordRegex
                                                .hasMatch(value)) {
                                              return 'Password must be at least 8 characters and include letters, numbers, and special characters';
                                            }
                                            return null;
                                          },
                                          obscureText: value.passwordVisible,
                                          hintText: "Password",
                                          controller: value.passwordTxt))
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
                            child: GestureDetector(
                                onTap: () {
                                  if (value.formKey.currentState!.validate()) {
                                    DataBaseHelper()
                                        .insertData(
                                            value.emailTxt.text,
                                            value.phoneTxt.text,
                                            db!,
                                            value.passwordTxt.text)
                                        .then((val) {
                                      if (val) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Register Success")));
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginScreen(
                                              prefs: widget.prefs);
                                        }));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text("User Already")));
                                      }
                                    });
                                  }
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          child: const Text("Register",
                                              style: TextStyle(
                                                  color: Colors.black)))
                                    ])))
                      ])))));
    });
  }
}
