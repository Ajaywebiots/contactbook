import 'package:contactbook/common/extension/text_style_extensions.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/spacing.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/screen/app_screen/payment_gateway_screen/layouts/grid_view_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/theme/app_css.dart';
import '../../../provider/payment_gateway_provider/payment_provider.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context1, paymentUtilsPvr, child) {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(backgroundColor: const Color(0xff141316)),
              backgroundColor: const Color(0xff141316),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appFonts.selectPayment,
                        style: appCss.philosopherBold28
                            .textColor(appColor(context).appTheme.whiteColor)),
                    const VSpace(Insets.i20),
                    Container(
                        height: Insets.i600,
                        padding: const EdgeInsets.all(Insets.i20),
                        decoration: BoxDecoration(
                            color: appColor(context).appTheme.whiteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(Insets.i40))),
                        child: GridView.builder(
                            itemCount: appArray.paymentList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GridViewLayout(
                                  data: appArray.paymentList[index]);
                            }))
                  ]).padding(horizontal: Insets.i20)));
    });
  }
}
