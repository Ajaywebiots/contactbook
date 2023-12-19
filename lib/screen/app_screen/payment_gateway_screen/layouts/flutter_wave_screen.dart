import 'package:contactbook/common/extension/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/theme/app_css.dart';
import '../../../../config.dart';
import '../../../../provider/payment_gateway_provider/flutter_wave_provider.dart';

class FlutterWaveScreen extends StatelessWidget {
  const FlutterWaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlutterWaveProvider>(
        builder: (context, flutterWavePvr, child) {
      return Scaffold(
          body: Column(children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            height: Insets.i110,
            decoration: BoxDecoration(
                color: appColor(context).appTheme.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            child: SizedBox(
                width: 200,
                child: TextField(
                    // controller: flutterWavePvr.amount,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: appCss.philosopherBold25
                        .textColor(appColor(context).appTheme.whiteColor),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Amount',
                        hintStyle: appCss.philosopherBold25
                            .textColor(appColor(context).appTheme.black)),
                    keyboardType: TextInputType.number)))
      ]));
    });
  }
}
