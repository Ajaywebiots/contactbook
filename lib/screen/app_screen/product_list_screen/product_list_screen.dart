import 'dart:developer';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/product_list_provider/product_list_provider.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/product_grid_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/product_array_model.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListProvider>(
        builder: (context, productListPvr, child) {
          final filterProducts = productArrayList.where((product) {
            return productListPvr.selectedSize.isEmpty ||
                // ignore: iterable_contains_unrelated_type
                productListPvr.selectedSize.contains(product.size);
          }).toList();


          return StatefulWrapper(
              onInit: () =>
                  Future.delayed(const Duration(milliseconds: 100),
                          () =>
                          productListPvr.removeDuplicateBySize(
                              productArrayList)),
              child: Scaffold(
                  appBar: AppBar(backgroundColor: Colors.blue.shade200,
                      actions: [
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                          return Consumer<ProductListProvider>(
                                              builder: (context, value, child) {
                                                return Column(children: [
                                                  Expanded(
                                                      child: Row(children: [
                                                        Column(children: [
                                                          Row(children: [
                                                            InkWell(
                                                                onTap: () =>
                                                                    value
                                                                        .onPriceTap(),
                                                                child: Container(
                                                                    margin:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                    height: 40,
                                                                    width: 120,
                                                                    alignment: Alignment
                                                                        .center,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          20),
                                                                      color: Colors
                                                                          .blue
                                                                          .shade200,
                                                                    ),
                                                                    child: Text(
                                                                        value
                                                                            .ll[0])))
                                                          ]),
                                                          Row(children: [
                                                            InkWell(
                                                                onTap: () =>
                                                                    value
                                                                        .onColorTap(),
                                                                child: Container(
                                                                    margin:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                    height: 40,
                                                                    width: 120,
                                                                    alignment: Alignment
                                                                        .center,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .blue
                                                                            .shade200,
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            20)),
                                                                    child: Text(
                                                                        value
                                                                            .ll[1])))
                                                          ]),
                                                          Row(children: [
                                                            InkWell(
                                                                onTap: () =>
                                                                    value
                                                                        .onSizeTap(),
                                                                child: Container(
                                                                    margin:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                    height: 40,
                                                                    width: 120,
                                                                    alignment: Alignment
                                                                        .center,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .blue
                                                                            .shade200,
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            20)),
                                                                    child: Text(
                                                                        value
                                                                            .ll[2])))
                                                          ])
                                                        ]),
                                                        Column(children: [
                                                          value.isSelected == 0
                                                              ? StatefulBuilder(
                                                              builder: (context,
                                                                  setState) {
                                                                return Container(
                                                                    alignment: Alignment
                                                                        .center,
                                                                    color: Colors
                                                                        .blue
                                                                        .shade50,
                                                                    height: 100,
                                                                    width: 270,
                                                                    child: Column(
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          RangeSlider(
                                                                              activeColor:
                                                                              Colors
                                                                                  .black,
                                                                              values: productListPvr
                                                                                  .currentRangeValues,
                                                                              labels: RangeLabels(
                                                                                productListPvr
                                                                                    .currentRangeValues
                                                                                    .start
                                                                                    .toStringAsFixed(
                                                                                    2),
                                                                                productListPvr
                                                                                    .currentRangeValues
                                                                                    .end
                                                                                    .toStringAsFixed(
                                                                                    2),
                                                                              ),
                                                                              onChanged: (
                                                                                  val) {
                                                                                setState(() {
                                                                                  productListPvr
                                                                                      .currentRangeValues =
                                                                                      val;
                                                                                });
                                                                              },
                                                                              min: 0,
                                                                              // Adjust this value if needed
                                                                              max: productListPvr
                                                                                  .maxPrice),
                                                                          Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                    "Start: ${productListPvr
                                                                                        .currentRangeValues
                                                                                        .start
                                                                                        .toStringAsFixed(
                                                                                        2)}")
                                                                                    .padding(
                                                                                    left: 10),
                                                                                Text(
                                                                                    "End: ${productListPvr
                                                                                        .currentRangeValues
                                                                                        .end
                                                                                        .toStringAsFixed(
                                                                                        2)}",
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .end)
                                                                                    .padding(
                                                                                    right: 10)
                                                                              ]
                                                                          )
                                                                        ]));
                                                              })
                                                              : value
                                                              .isSelected ==
                                                              1
                                                              ? Expanded(
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                          width: 60),
                                                                      const Text(
                                                                          "Select All"),
                                                                      const SizedBox(
                                                                          width: 100),
                                                                      Container(
                                                                        margin: const EdgeInsets
                                                                            .all(
                                                                            10),
                                                                        height: 20,
                                                                        width: 20,
                                                                        decoration: ShapeDecoration(
                                                                            color: productListPvr
                                                                                .isSelectedAllColor ==
                                                                                true
                                                                                ? const Color(
                                                                                0xff5465FF)
                                                                                : Colors
                                                                                .white,
                                                                            shape: SmoothRectangleBorder(
                                                                                side: BorderSide(
                                                                                    color: productListPvr
                                                                                        .isSelectedAllColor ==
                                                                                        true
                                                                                        ? Colors
                                                                                        .transparent
                                                                                        : const Color(
                                                                                        0xffE5E8EA)),
                                                                                borderRadius: const SmoothBorderRadius
                                                                                    .all(
                                                                                    SmoothRadius(
                                                                                        cornerRadius:
                                                                                        5,
                                                                                        cornerSmoothing:
                                                                                        1)))),
                                                                        child: productListPvr
                                                                            .isSelectedAllColor ==
                                                                            true
                                                                            ? SvgPicture
                                                                            .asset(
                                                                            "assets/svg/tick.svg",
                                                                            fit: BoxFit
                                                                                .scaleDown,
                                                                            height: 10,
                                                                            width: 10)
                                                                            : null,
                                                                      )
                                                                    ]
                                                                ).inkWell(
                                                                    context,
                                                                    onTap: () {
                                                                      setState(() {
                                                                        productListPvr
                                                                            .isSelectedAllColor =
                                                                        !productListPvr
                                                                            .isSelectedAllColor;
                                                                      });
                                                                    }),
                                                                Expanded(
                                                                    child: SizedBox(
                                                                        height: 200,
                                                                        width: 270,
                                                                        child: ListView
                                                                            .builder(
                                                                            itemCount:
                                                                            productListPvr
                                                                                .colorList
                                                                                .length,
                                                                            itemBuilder:
                                                                                (
                                                                                context,
                                                                                index) {
                                                                              return ListTile(
                                                                                  onTap: () =>
                                                                                      productListPvr
                                                                                          .onColorSelected(
                                                                                          index),
                                                                                  tileColor: Colors
                                                                                      .blue
                                                                                      .shade50,
                                                                                  leading: Container(
                                                                                      decoration: BoxDecoration(
                                                                                          borderRadius:
                                                                                          const BorderRadius
                                                                                              .all(
                                                                                              Radius
                                                                                                  .circular(
                                                                                                  20)),
                                                                                          color: Color(
                                                                                              int
                                                                                                  .parse(
                                                                                                  productListPvr
                                                                                                      .colorList[index]
                                                                                                      .substring(
                                                                                                      1,
                                                                                                      7),
                                                                                                  radix: 16) +
                                                                                                  0xFF000000),
                                                                                          border:
                                                                                          Border
                                                                                              .all(
                                                                                              color: Colors
                                                                                                  .white)),
                                                                                      height: 20,
                                                                                      width: 30),
                                                                                  title: Text(
                                                                                      "${productListPvr
                                                                                          .colorList[index]}"),
                                                                                  trailing: Container(
                                                                                    height: 20,
                                                                                    width: 20,
                                                                                    decoration: ShapeDecoration(
                                                                                        color: productArrayList[index]
                                                                                            .isColorSelected ==
                                                                                            true
                                                                                            ? const Color(
                                                                                            0xff5465FF)
                                                                                            : Colors
                                                                                            .white,
                                                                                        shape: SmoothRectangleBorder(
                                                                                            side:
                                                                                            BorderSide(
                                                                                                color: productArrayList[index]
                                                                                                    .isColorSelected ==
                                                                                                    true
                                                                                                    ? Colors
                                                                                                    .transparent
                                                                                                    : const Color(
                                                                                                    0xffE5E8EA)),
                                                                                            borderRadius: const SmoothBorderRadius
                                                                                                .all(
                                                                                                SmoothRadius(
                                                                                                    cornerRadius: 5,
                                                                                                    cornerSmoothing: 1)))),
                                                                                    child: productArrayList[index]
                                                                                        .isColorSelected ==
                                                                                        true
                                                                                        ? SvgPicture
                                                                                        .asset(
                                                                                        "assets/svg/tick.svg",
                                                                                        fit: BoxFit
                                                                                            .scaleDown,
                                                                                        height:
                                                                                        10,
                                                                                        width:
                                                                                        10)
                                                                                        : null,
                                                                                  ));
                                                                            }))),
                                                              ],
                                                            ),
                                                          )
                                                              : Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                      children: [
                                                                        const SizedBox(
                                                                            width: 60),
                                                                        const Text(
                                                                            "Select All"),
                                                                        const SizedBox(
                                                                            width: 100),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .all(
                                                                              10),
                                                                          height: 20,
                                                                          width: 20,
                                                                          decoration: ShapeDecoration(
                                                                              color: productListPvr
                                                                                  .isSelectedAllSize ==
                                                                                  true
                                                                                  ? const Color(
                                                                                  0xff5465FF)
                                                                                  : Colors
                                                                                  .white,
                                                                              shape: SmoothRectangleBorder(
                                                                                  side: BorderSide(
                                                                                      color: productListPvr
                                                                                          .isSelectedAllSize ==
                                                                                          true
                                                                                          ? Colors
                                                                                          .transparent
                                                                                          : const Color(
                                                                                          0xffE5E8EA)),
                                                                                  borderRadius: const SmoothBorderRadius
                                                                                      .all(
                                                                                      SmoothRadius(
                                                                                          cornerRadius:
                                                                                          5,
                                                                                          cornerSmoothing:
                                                                                          1)))),
                                                                          child: productListPvr
                                                                              .isSelectedAllSize ==
                                                                              true
                                                                              ? SvgPicture
                                                                              .asset(
                                                                              "assets/svg/tick.svg",
                                                                              fit: BoxFit
                                                                                  .scaleDown,
                                                                              height: 10,
                                                                              width: 10)
                                                                              : null,
                                                                        )
                                                                      ]
                                                                  ).inkWell(
                                                                      context,
                                                                      onTap: () {
                                                                        setState(() {
                                                                          productListPvr
                                                                              .isSelectedAllSize =
                                                                          !productListPvr
                                                                              .isSelectedAllSize;
                                                                        });
                                                                      }),
                                                                  Expanded(
                                                                    child: SizedBox(
                                                                        height: 200,
                                                                        width: 270,
                                                                        child: ListView
                                                                            .builder(
                                                                            itemCount:
                                                                            productListPvr
                                                                                .sizeList
                                                                                .length,
                                                                            itemBuilder:
                                                                                (
                                                                                context,
                                                                                index) {
                                                                              return ListTile(
                                                                                  onTap: () =>
                                                                                      productListPvr
                                                                                          .onSizeSelected(
                                                                                          index),
                                                                                  title: Text(
                                                                                      "${productListPvr
                                                                                          .sizeList[index]}"),
                                                                                  trailing: Container(
                                                                                      height: 20,
                                                                                      width: 20,
                                                                                      decoration: ShapeDecoration(
                                                                                          color: productArrayList[index]
                                                                                              .isSizeSelected ==
                                                                                              true
                                                                                              ? const Color(
                                                                                              0xff5465FF)
                                                                                              : Colors
                                                                                              .white,
                                                                                          shape: SmoothRectangleBorder(
                                                                                              side:
                                                                                              BorderSide(
                                                                                                  color: productArrayList[index]
                                                                                                      .isSizeSelected ==
                                                                                                      true
                                                                                                      ? Colors
                                                                                                      .transparent
                                                                                                      : const Color(
                                                                                                      0xffE5E8EA)),
                                                                                              borderRadius: const SmoothBorderRadius
                                                                                                  .all(
                                                                                                  SmoothRadius(
                                                                                                      cornerRadius: 5,
                                                                                                      cornerSmoothing: 1)))),
                                                                                      child: productArrayList[index]
                                                                                          .isSizeSelected ==
                                                                                          true
                                                                                          ? SvgPicture
                                                                                          .asset(
                                                                                          "assets/svg/tick.svg",
                                                                                          fit: BoxFit
                                                                                              .scaleDown,
                                                                                          height: 10,
                                                                                          width: 10)
                                                                                          : null));
                                                                            })),
                                                                  ),
                                                                ],
                                                              ))
                                                        ])
                                                      ])),
                                                  Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                      children: [
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 100,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .blue
                                                                    .shade200,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    20)),
                                                            child: const Text(
                                                                "Clear All"))
                                                            .inkWell(
                                                            context, onTap: () {
                                                          setState(() {
                                                            productListPvr
                                                                .currentRangeValues =
                                                            const RangeValues(
                                                                0, 100);
                                                          });
                                                        }),
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 100,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .blue
                                                                    .shade200,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    20)),
                                                            child:
                                                            const Text(
                                                                "Apply Filter"))
                                                            .inkWell(
                                                            context, onTap: () {
                                                          log(
                                                              "sizeSortList${productListPvr
                                                                  .sizeSortList}");
                                                          setState(() {
                                                            final listColor = productListPvr
                                                                .sizeSortList
                                                                .contains(
                                                                productListPvr
                                                                    .sizeList);
                                                            log(
                                                                "listColor$listColor");

                                                            if (productListPvr
                                                                .sizeSortList
                                                                .contains(
                                                                productListPvr
                                                                    .sizeList)) {
                                                              productListPvr
                                                                  .sizeSortList
                                                                  .add(
                                                                  productListPvr
                                                                      .sizeSortList
                                                                      .contains(
                                                                      productListPvr
                                                                          .sizeList));
                                                            }


                                                            setState(() {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          });
                                                        })
                                                      ])
                                                ]).backgroundColor(
                                                    Colors.blue.shade50);
                                              });
                                        });
                                  });
                            },
                            icon: const Icon(Icons.filter_alt_outlined))
                      ]),
                  body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: GridView.builder(
                                itemCount: productArrayList.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return ProductGrid(
                                      productArrayList[index]);
                                }) /*GridView.builder(
                                itemCount: filterProducts.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return ColorGrid(
                                    filterProducts[index]);
                                })*/)
                      ]).padding(all: 20)));
        });
  }
}
