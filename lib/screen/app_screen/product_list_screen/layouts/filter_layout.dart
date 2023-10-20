import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/product_list_provider/product_list_provider.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/color_list_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/common_row_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/range_slider_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/size_list_layout.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'common_container_layout.dart';

class FilterLayout extends StatelessWidget {
  const FilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, setState) {
          return Consumer<ProductListProvider>(
              builder: (context, productListPvr, child) {
                return Column(children: [
                  Expanded(
                      child: Row(children: [
                        Column(children: [
                          CommonRowLayout(
                              onTap: () => productListPvr.onPriceTap(),
                              text: productListPvr.ll[0]),
                          CommonRowLayout(
                              onTap: () => productListPvr.onColorTap(),
                              text: productListPvr.ll[1]),
                          CommonRowLayout(
                              onTap: () => productListPvr.onSizeTap(),
                              text: productListPvr.ll[2])
                        ]),
                        Column(children: [
                          productListPvr.isSelected == 0
                              ? StatefulBuilder(
                              builder: (context, setState) {
                                return RangeSliderLayout(
                                    productListPvr
                                        .currentRangeValues,
                                    productListPvr);
                              })
                              : productListPvr.isSelected == 1
                              ? Expanded(
                              child: Column(children: [
                                Row(children: [
                                  const SizedBox(width: 60),
                                  const Text("Select All"),
                                  const SizedBox(width: 100),
                                  Container(
                                      margin: const EdgeInsets.all(
                                          10),
                                      height: 20,
                                      width: 20,
                                      decoration: ShapeDecoration(
                                          color: productListPvr.isSelectedAllColor == true
                                              ? const Color(
                                              0xff5465FF)
                                              : Colors.white,
                                          shape: SmoothRectangleBorder(
                                              side: BorderSide(
                                                  color: productListPvr.isSelectedAllColor == true
                                                      ? Colors
                                                      .transparent
                                                      : const Color(
                                                      0xffE5E8EA)),
                                              borderRadius: const SmoothBorderRadius.all(SmoothRadius(
                                                  cornerRadius:
                                                  5,
                                                  cornerSmoothing:
                                                  1)))),
                                      child: productListPvr.isSelectedAllColor == true
                                          ? SvgPicture.asset("assets/svg/tick.svg",
                                          fit: BoxFit.scaleDown,
                                          height: 10,
                                          width: 10)
                                          : null)
                                ]).inkWell(context,
                                    onTap: () => productListPvr
                                        .selectAllColor()),
                                Expanded(
                                    child: SizedBox(
                                        height: 200,
                                        width: 270,
                                        child:
                                        ListView.builder(
                                            itemCount:
                                            productListPvr
                                                .colorList
                                                .length,
                                            itemBuilder:
                                                (context,
                                                index) {
                                              return ColorListLayout(
                                                colorList:
                                                productListPvr
                                                    .colorList[index],
                                                onColorSelected:
                                                    () =>
                                                        productListPvr.onColorSelected(productListPvr.colorList[index]),
                                                isSelected: productListPvr
                                                    .selectedColor
                                                    .contains(
                                                    productListPvr.colorList[index]),
                                              );
                                            })))
                              ]))
                              : Expanded(
                              child: Column(children: [
                                Row(children: [
                                  const SizedBox(width: 60),
                                  const Text("Select All"),
                                  const SizedBox(width: 100),
                                  Container(
                                      margin: const EdgeInsets.all(
                                          10),
                                      height: 20,
                                      width: 20,
                                      decoration: ShapeDecoration(
                                          color: productListPvr.isSelectedAllSize == true
                                              ? const Color(
                                              0xff5465FF)
                                              : Colors.white,
                                          shape: SmoothRectangleBorder(
                                              side: BorderSide(
                                                  color: productListPvr.isSelectedAllSize == true
                                                      ? Colors
                                                      .transparent
                                                      : const Color(
                                                      0xffE5E8EA)),
                                              borderRadius: const SmoothBorderRadius.all(SmoothRadius(
                                                  cornerRadius:
                                                  5,
                                                  cornerSmoothing:
                                                  1)))),
                                      child: productListPvr.isSelectedAllSize == true
                                          ? SvgPicture.asset("assets/svg/tick.svg",
                                          fit: BoxFit.scaleDown,
                                          height: 10,
                                          width: 10)
                                          : null)
                                ]).inkWell(context,
                                    onTap: () => productListPvr
                                        .selectAllSize()),
                                Expanded(
                                    child: SizedBox(
                                        height: 200,
                                        width: 270,
                                        child:
                                        ListView.builder(
                                            itemCount:
                                            productListPvr
                                                .sizeList
                                                .length,
                                            itemBuilder:
                                                (context,
                                                index) {
                                              return SizeLayout(
                                                  onTap: () =>
                                                      productListPvr.onSizeSelected(productListPvr.sizeList[
                                                      index]),
                                                  title: productListPvr.sizeList[
                                                  index],
                                                  isSelected: productListPvr
                                                      .selectedSize
                                                      .contains(productListPvr.sizeList[index]));
                                            })))
                              ]))
                        ])
                      ])),
                  Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        CommonContainer(
                            onTap: () => productListPvr
                                .onClearAll(context),
                            text: "Clear All"),
                        CommonContainer(
                            onTap: () => productListPvr
                                .onApplyChange(context),
                            text: "Apply Filter")
                      ])
                ]).backgroundColor(Colors.blue.shade50);
              });
        });
  }
}
