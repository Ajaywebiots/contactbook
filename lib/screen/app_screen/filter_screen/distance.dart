import 'dart:developer';
import 'dart:ui';
import 'package:contactbook/extensions/spacing.dart';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'distance_custom_shape/custom_shape.dart';

class Distance extends StatefulWidget {
  const Distance({super.key});

  @override
  State<Distance> createState() => _DistanceState();
}

class _DistanceState extends State<Distance> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PopUpListProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
          onInit: () {
            Future.delayed(const Duration(milliseconds: 150))
                .then((value) async {
              FrameInfo fi =
                  await value.loadImage("assets/images/userSlider.png");
              value.customImage = fi.image;

              value.notifyListeners();
            });
          },
          child: Column(children: [
            const ListTile(title: Text("Distance")),
            Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: SmoothBorderRadius(cornerRadius: 10)),
                child: ListTile(
                    trailing: InkWell(
                        onTap: () => value.onChange(),
                        child: value.isSelect == false
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xff5465FF)
                                        .withOpacity(0.18)),
                                width: 22,
                                height: 22,
                                child: const Icon(Icons.circle,
                                    color: Color(0xff5465FF), size: 13))
                            : Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffE5E8EA)),
                                    shape: BoxShape.circle),
                                height: 22,
                                width: 22)),
                    leading: SvgPicture.asset("assets/svg/map.svg"),
                    title: const Text("Near by location"))),
            SizedBox(
                height: 124,
                child: Card(
                    elevation: 2,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: SmoothBorderRadius(cornerRadius: 10)),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset("assets/svg/global.svg"),
                                  const HSpace(30),
                                  const Text("Distance location"),
                                ]),
                                InkWell(
                                    onTap: () => value.onChange1(),
                                    child: value.isSelect == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: const Color(0xff5465FF)
                                                    .withOpacity(0.18)),
                                            width: 22,
                                            height: 22,
                                            child: const Icon(Icons.circle,
                                                color: Color(0xff5465FF),
                                                size: 13))
                                        : Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffE5E8EA)),
                                                shape: BoxShape.circle),
                                            height: 22,
                                            width: 22))
                              ]),
                          const VSpace(15),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 1,
                              child: FutureBuilder<FrameInfo>(
                                  future: value.loadImage(
                                      "assets/images/userSlider.png"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != null) {
                                      return SfSliderTheme(
                                          data: SfSliderThemeData(
                                              inactiveTrackColor:
                                                  const Color(0xffE5E8EA),
                                              activeLabelStyle: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              inactiveLabelStyle:
                                                  const TextStyle(
                                                      fontFamily:
                                                          "PoppinsRegular",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                              activeTrackColor: Colors.black),
                                          child: SfSlider(
                                            activeColor: Colors.black,
                                            min: 0.0,
                                            max: 30.0,
                                            interval: 5,
                                            showDividers: true,
                                            dividerShape:
                                                const SfDividerShape(),
                                            showLabels: true,
                                            showTicks: true,
                                            labelFormatterCallback:
                                                (dynamic actualValue,
                                                    String formattedText) {
                                              switch (actualValue) {
                                                case 0:
                                                  return '';
                                                case 5:
                                                  return '05\nKm';
                                                case 10:
                                                  return '10\nKm';
                                                case 15:
                                                  return '15\nKm';
                                                case 20:
                                                  return '20\nKm';
                                                case 25:
                                                  return '25\nKm';
                                                case 30:
                                                  return '30\nKm';
                                              }
                                              return actualValue.toString();
                                            },
                                            thumbShape: CustomThumbShape(
                                                snapshot.data!.image),
                                            value: value.slider,
                                            onChanged: (dynamic newValue) =>
                                                value.slidingValue(newValue),
                                          ));
                                    } else {
                                      return Container();
                                    }
                                  }))
                        ]))))
          ]));
    });
  }
}
