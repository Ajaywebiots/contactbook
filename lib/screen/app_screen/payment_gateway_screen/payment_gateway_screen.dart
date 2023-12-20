import 'package:contactbook/common/extension/text_style_extensions.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/spacing.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/theme/app_css.dart';
import '../../../provider/payment_gateway_provider/paymentutils.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentUtils>(builder: (context1, paymentUtilsPvr, child) {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(backgroundColor: const Color(0xff141316)),
              backgroundColor: const Color(0xff141316),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Select Payment Method",
                        style: appCss.philosopherBold28
                            .textColor(appColor(context).appTheme.whiteColor)),
                    const VSpace(Insets.i20),
                    Container(
                        height: 600,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: appColor(context).appTheme.whiteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: GridView.builder(
                            itemCount: appArray.paymentList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              appArray.paymentList[index]
                                                  ['paymentImage'])),
                                      color: appColor(context).appTheme.black,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40))),
                                  child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => appArray.paymentList[index]['navigate']))));
                            }))
                  ]).padding(horizontal: 20)));
    });
  }
}
