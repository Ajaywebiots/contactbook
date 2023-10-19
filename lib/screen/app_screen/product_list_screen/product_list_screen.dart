import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/product_list_provider/product_list_provider.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/color_list_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/common_container_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/common_gridview_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/common_row_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/size_list_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/product_array_model.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/common/theme/app_css.dart';
import 'layouts/range_slider_layout.dart';

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
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 100),
              () => productListPvr.removeDuplicateBySize(productArrayList)),
          child: Scaffold(
              appBar: AppBar(backgroundColor: Colors.blue.shade200, actions: [
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
                                      CommonRowLayout(
                                          onTap: () => value.onPriceTap(),
                                          text: value.ll[0]),
                                      CommonRowLayout(
                                          onTap: () => value.onColorTap(),
                                          text: value.ll[1]),
                                      CommonRowLayout(
                                          onTap: () => value.onSizeTap(),
                                          text: value.ll[2]),
                                    ]),
                                    Column(children: [
                                      value.isSelected == 0
                                          ? StatefulBuilder(
                                              builder: (context, setState) {
                                              return RangeSliderLayout(
                                                  productListPvr
                                                      .currentRangeValues,
                                                  productListPvr);
                                            })
                                          : value.isSelected == 1
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
                                                      onTap: () => value
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
                                                                              value.onColorSelected(productListPvr.colorList[index]),
                                                                      isSelected: value
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
                                                      onTap: () => value
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
                                                                            value.onSizeSelected(productListPvr.sizeList[
                                                                                index]),
                                                                        title: productListPvr.sizeList[
                                                                            index],
                                                                        isSelected: value
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
                                            onTap: () {
                                              productListPvr
                                                      .currentRangeValues =
                                                  RangeValues(
                                                      0,
                                                      productListPvr
                                                          .currentRangeValues
                                                          .end);
                                            },
                                            text: "Clear All"),
                                        CommonContainer(
                                            onTap: () {
                                              setState(() {
                                                // productListPvr.minPrice ==
                                                //     productListPvr
                                                //         .currentRangeValues
                                                //         .start;
                                                // productListPvr
                                                //     .updateSelectedProducts();
                                                // productListPvr.maxPrice =
                                                //     productListPvr
                                                //         .currentRangeValues.end;
                                                // productListPvr
                                                //     .updateSelectedProducts();
                                                // productListPvr.filterProductsByColor();
                                                Navigator.pop(context);
                                              });
                                            },
                                            text: "Apply Filter")
                                      ])
                                ]).backgroundColor(Colors.blue.shade50);
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
                        child: /*productListPvr.isSelectedAllSize == true
                            ?*/
                            /*CommonGridView(
                                itemCount: productArrayList.length,
                                itemBuilder: (context, index) {
                                  return ProductGrid(productArrayList[index]);
                                })*/
                            /* : productListPvr.isSelectedAllColor == true
                                ? CommonGridView(
                                    itemCount:
                                        productListPvr.selectedColor.length,
                                    itemBuilder: (context, index) {
                                      return Column(children: [
                                        Text(
                                            "${productListPvr.selectedColor[index]}")
                                      ]);
                                    })
                                :*/
                            CommonGridView(
                                itemCount:
                                    productListPvr.selectedProducts.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Card(
                                            color: Colors.black,
                                            elevation: 5,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Card(
                                                      elevation: 5,
                                                      child: Image.network(
                                                          productListPvr
                                                              .selectedProducts[
                                                                  index]
                                                              .imageUrl,
                                                          height: 120,
                                                          width: 200)),
                                                  Text(
                                                          productListPvr
                                                              .selectedProducts[
                                                                  index]
                                                              .name,
                                                          style: AppCss
                                                              .philosopherBold14
                                                              .textColor(
                                                                  Colors.white),
                                                          overflow: TextOverflow
                                                              .ellipsis)
                                                      .padding(all: 5),
                                                  Text(
                                                      '₹${productListPvr.selectedProducts[index].price}',
                                                      style: AppCss
                                                          .philosopherBold14
                                                          .textColor(
                                                              Colors.white))
                                                ]))
                                      ]);
                                }),


                    )
                  ]).padding(all: 20)));
    });
  }
}
