import 'package:carousel_slider/carousel_slider.dart';
import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/spacing.dart';
import 'package:contactbook/provider/date_time_provider/date_time_provider.dart';
import 'package:contactbook/screen/app_screen/date_&_time/layouts/rps_custom_painter.dart';
import 'package:contactbook/widgets/common_decrement_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTimePicker extends StatelessWidget {
  final String title;
  final Function() onDecrement;
  final Function() onIncrement;
  final Function(int) onScroll;
  final CarouselController carouselController;
  final List<String> itemList;

  const CustomTimePicker(
      {super.key,
      required this.title,
      required this.onDecrement,
      required this.onIncrement,
      required this.onScroll,
      required this.carouselController,
      required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(builder: (context, dateTimePvr, child) {
      return CustomPaint(
          painter: RPSCustomPainter(),
          child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const VSpace(6),
                    CommonDecrementInkWell(
                        onTap: onDecrement,
                        assetPath: svgAssets.decrement),
                    Expanded(
                        child: CarouselSlider.builder(
                            carouselController: carouselController,
                            itemCount: itemList.length,
                            itemBuilder: (context, index, realIndex) {
                              return Text(
                                  textAlign: TextAlign.center,
                                  itemList[index],
                                  style: TextStyle(
                                      color: dateTimePvr.appColor.primaryColor,
                                      fontSize: 22));
                            },
                            options: CarouselOptions(
                                onPageChanged: (index, reason) =>
                                    onScroll(index),
                                autoPlay: false,
                                scrollDirection: Axis.vertical))),
                    CommonDecrementInkWell(
                        onTap: onIncrement,
                        assetPath: svgAssets.increment),
                    const VSpace(6)
                  ])));
    });
  }
}
