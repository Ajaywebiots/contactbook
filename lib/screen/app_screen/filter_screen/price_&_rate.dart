import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: SmoothBorderRadius(cornerRadius: 10)),
                      child: ListTile(
                          leading: Text(value.ratingList[index]['rate']),
                          title: SvgPicture.asset(value.ratingList[index]['icon'],
                              alignment: Alignment.centerLeft, height: 14),
                          trailing: InkWell(
                              onTap: () => value.onPriceListCheck(index),
                              child: value.ratingList[index]['isRated'] == true
                                  ? Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xff5465FF)
                                              .withOpacity(0.18)),
                                      child:  const Icon(Icons.circle,
                                          color: Color(0xff5465FF), size: 13))
                                  : Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: const Color(0xffE5E8EA)))))));
                }))
      ]);
    });
  }
}
