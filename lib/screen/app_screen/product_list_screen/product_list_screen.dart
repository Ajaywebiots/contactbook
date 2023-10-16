import 'dart:developer';

import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/product_list_provider/product_list_provider.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/modelclass.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/product_array_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List sizeList = [], colorList = [];

  removeDuplicateBySize(List<Product> productList) {
    for (var product in productList) {
      List sizeKey = product.size;
      List colorKey = product.color;
      log("colorList :: ${product.color}");
      sizeKey.asMap().entries.forEach((element) {
        if (!sizeList.contains(element.value)) {
          sizeList.add(element.value);
        }
      });
      colorKey.asMap().entries.forEach((element) {
        if (!colorList.contains(element.value)) {
          colorList.add(element.value);
        }
      });
    }
    setState(() {
      log("sizeList :: $sizeList");
      log("colorList :: $colorList");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    removeDuplicateBySize(productArrayList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListProvider>(
        builder: (context, productListPvr, child) {
      return Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(children: [
                          Row(children: [
                            Container(
                              color: Colors.green,
                              width: 150,
                              height: 100,
                              child: const Column(),
                            ),
                            Container(
                              color: Colors.black,
                              child: const Column(),
                            ),
                          ]),
                          // Row(children: [
                          //   const Text("PRICE - "),
                          //   Expanded(
                          //       child: RangeSlider(
                          //           values: RangeValues(productListPvr.start,
                          //               productListPvr.end),
                          //           labels: RangeLabels(
                          //               productListPvr.start.toString(),
                          //               productListPvr.end.toString()),
                          //           onChanged: (value) {
                          //             setState(() {
                          //               productListPvr.start = value.start;
                          //               productListPvr.end = value.end;
                          //             });
                          //           },
                          //           min: 0,
                          //           max: 1000))
                          // ]),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text("Start: \n   ${productListPvr.start.toStringAsFixed(0)}")
                          //           .padding(left: 50),
                          //       Text("End: \n  ${productListPvr.end.toStringAsFixed(0)}",
                          //               textAlign: TextAlign.end)
                          //           .padding(right: 10)
                          //     ]),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [Text("SIZE - "), SizedBox(width: 10)]),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [Text("COLOR - ")])
                        ]);
                      });
                },
                icon: const Icon(Icons.filter_alt_outlined))
          ]),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: GridView.builder(
                    itemCount: productArrayList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Card(
                          color: Colors.black,
                          elevation: 5,
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: [
                            Card(
                                elevation: 5,
                                child: Image.network(
                                    productArrayList[index].imageUrl,
                                    height: 120,
                                    width: 200)),
                            Text(productArrayList[index].name,
                                    style: AppCss.philosopherBold14
                                        .textColor(Colors.white),
                                    overflow: TextOverflow.ellipsis)
                                .padding(all: 5),
                            Text('₹${productArrayList[index].price}',
                                style: AppCss.philosopherBold14
                                    .textColor(Colors.white))
                          ]));
                    }))
          ]).padding(all: 20));
    });
  }
}
