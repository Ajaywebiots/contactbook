import 'dart:ui';
import 'package:contactbook/extensions/spacing.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:contactbook/screen/app_screen/filter_screen/layouts/sfslider_theme_layout.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/config.dart';

import '../../../common/assets/index.dart';
import 'layouts/distance_custom_shape/custom_shape.dart';

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
                  await value.loadImage(eSvgAssets.userSlider);
              value.customImage = fi.image;
              value.notifyListeners();
            });
          },
          child: Column(children: [
            Row(children: [Text(appFonts.distance)])
                .padding(horizontal: 15, vertical: 20),
            Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: SmoothBorderRadius(cornerRadius: 10)),
                child: ListTile(
                    trailing: InkWell(
                        onTap: () => value.onChange(),
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: value.isSelect == false
                                    ? const Color(0xff5465FF).withOpacity(0.18)
                                    : const Color(0xffE5E8EA)),
                            width: 22,
                            height: 22,
                            child: const Icon(Icons.circle,
                                color: Color(0xff5465FF), size: 13))),
                    leading: SvgPicture.asset(eSvgAssets.map),
                    title: Text(appFonts.nearByLocation))),
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
                                  SvgPicture.asset(eSvgAssets.global),
                                  const HSpace(30),
                                   Text(appFonts.distanceLocation),
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
                                      eSvgAssets.userSlider),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != null) {
                                      return SFSliderThemeLayout(
                                          thumbShape: CustomThumbShape(
                                              snapshot.data!.image),
                                          value: value.slider,
                                          onChanged: (dynamic newValue) =>
                                              value.slidingValue(newValue));
                                    } else {
                                      return Container();
                                    }
                                  }))
                        ]))))
          ]));
    });
  }
}
