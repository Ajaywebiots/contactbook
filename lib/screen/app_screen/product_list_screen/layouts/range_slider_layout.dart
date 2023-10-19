import 'dart:developer';

import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/product_list_provider/product_list_provider.dart';
import 'package:flutter/material.dart';

class RangeSliderLayout extends StatelessWidget {
  final RangeValues prdCurrentRangeValues;
  final ProductListProvider productListPvr;

  const RangeSliderLayout(this.prdCurrentRangeValues, this.productListPvr,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.blue.shade50,
        height: 100,
        width: 270,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSlider(
                  activeColor: Colors.black,
                  values: prdCurrentRangeValues,
                  labels: RangeLabels(
                      prdCurrentRangeValues.start.toStringAsFixed(2),
                      prdCurrentRangeValues.end.toStringAsFixed(2)),
                  onChanged: (val) => productListPvr.onSliderChange(val),
                  min: productListPvr.minPrice,
                  max: productListPvr.maxPrice),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Start: ${productListPvr.currentRangeValues.start.toStringAsFixed(2)}")
                    .padding(left: 10),
                Text("End: ${productListPvr.currentRangeValues.end.toStringAsFixed(2)}",
                        textAlign: TextAlign.end)
                    .padding(right: 10)
              ])
            ]));
  }
}
