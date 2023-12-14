import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:contactbook/screen/app_screen/filter_screen/category.dart';
import 'package:contactbook/screen/app_screen/filter_screen/distance.dart';
import 'package:contactbook/screen/app_screen/filter_screen/layouts/Common_popup_inkwell.dart';
import 'package:contactbook/screen/app_screen/filter_screen/price_&_rate.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layouts/common_container_button_layout.dart';

class PopUpList extends StatefulWidget {
  const PopUpList({super.key});

  @override
  State<PopUpList> createState() => _PopUpListState();
}

class _PopUpListState extends State<PopUpList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PopUpListProvider>(builder: (context, value, child) {
      double height = value.heightMQ(context);
      double width = value.widthMQ(context);
      return Container(
          height: 660,
          decoration: const ShapeDecoration(
              color: Colors.white,
              shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.only(
                      topLeft:
                          SmoothRadius(cornerRadius: 10, cornerSmoothing: 1),
                      topRight:
                          SmoothRadius(cornerRadius: 10, cornerSmoothing: 1)))),
          child: Column(children: [
            ListTile(
                title: const Text("Filter by (1)",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close))),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: height * 0.08,
                decoration: const BoxDecoration(
                    color: Color(0xffF5F6F7),
                    borderRadius: BorderRadius.all(Radius.circular(45))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Wrap(
                  //     children: List.generate(value.filterList.length, (index) {
                  //   return CommonPopInkwell(
                  //       onTap: () => value.selectedCategory(index),
                  //       index: value.isSelected,
                  //       text: value.filterList[index],
                  //       selectedIndex: 0);
                  // }))

                  ...value.filterList
                      .asMap()
                      .entries
                      .map((e) => CommonPopInkwell(
                          onTap: () => value.selectedCategory(e.key),
                          index: e.key,
                          text: e.value,
                          selectedIndex: value.isSelected))
                      .toList(),

                  // CommonPopInkwell(
                  //     onTap: () => value.selectedCategory0(),
                  //     index: value.isSelected,
                  //     text: "Category",
                  //     selectedIndex: 0,
                  //     borderRadius: const BorderRadius.only(
                  //         topLeft: Radius.circular(45),
                  //         bottomLeft: Radius.circular(45))),
                  // CommonPopInkwell(
                  //     onTap: () => value.selectedCategory1(),
                  //     index: value.isSelected,
                  //     selectedIndex: 1,
                  //     text: "Price & rate"),
                  // CommonPopInkwell(
                  //     onTap: () => value.selectedCategory1(),
                  //     index: value.isSelected,
                  //     selectedIndex: 2,
                  //     text: "Distance",
                  //     borderRadius: const BorderRadius.only(
                  //         topRight: Radius.circular(45),
                  //         bottomRight: Radius.circular(45))),
                ])),
            Expanded(
                child: value.isSelected == 0
                    ? const Category()
                    : value.isSelected == 1
                        ? const PriceRate()
                        : const Distance()),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonContainerButton(
                      text: 'Clear All', textColor: Color(0xff5465FF)),
                  CommonContainerButton(
                      text: 'Apply',
                      textColor: Colors.white,
                      color: Color(0xff5465FF))
                ])
          ]));
    });
  }
}
