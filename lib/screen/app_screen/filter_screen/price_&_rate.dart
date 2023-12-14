import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:contactbook/screen/app_screen/filter_screen/price_rate_layout.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceRate extends StatelessWidget {
  const PriceRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PopUpListProvider>(builder: (context, value, child) {
      double height = value.heightMQ(context);
      double width = value.widthMQ(context);
      return Column(children: [
        const Row(children: [Text("Price range")])
            .padding(horizontal: 15, vertical: 20),
        Container(
            height: height * 0.08,
            width: width * 0.92,
            decoration: const ShapeDecoration(
                color: Color(0xffF5F6F7),
                shape: SmoothRectangleBorder(
                    side: BorderSide(color: Color(0xffF5F6F7)),
                    borderRadius: SmoothBorderRadius.all(
                        SmoothRadius(cornerRadius: 10, cornerSmoothing: 1))))),
        const Row(children: [Text("Rates")])
            .padding(horizontal: 15, vertical: 20),
        Expanded(
            child: ListView.builder(
                itemCount: value.ratingList.length,
                itemBuilder: (context, index) {
                  return PriceRateLayout(
                      data: value.ratingList[index],
                      onTap: () => value.onPriceListCheck(index));
                }))
      ]);
    });
  }
}
