import 'package:contactbook/provider/popup_list_provider.dart';
import 'package:contactbook/screen/app_screen/filter_screen/category.dart';
import 'package:contactbook/screen/app_screen/filter_screen/distance.dart';
import 'package:contactbook/screen/app_screen/filter_screen/price_&_rate.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  InkWell(
                      onTap: () => value.selectedCategory0(),
                      child: Container(
                          height: height * 0.1,
                          width: width * 0.28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: value.isSelected == 0
                                  ? const Color(0xff5465FF)
                                  : const Color(0xffF5F6F7),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  bottomLeft: Radius.circular(45))),
                          child: Text("Category",
                              style: TextStyle(
                                  color: value.isSelected == 0
                                      ? Colors.white
                                      : Colors.black)))),
                  InkWell(
                      onTap: () => value.selectedCategory1(),
                      child: Container(
                          height: height * 0.1,
                          width: width * 0.28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: value.isSelected == 1
                                  ? const Color(0xff5465FF)
                                  : const Color(0xffF5F6F7)),
                          child: Text("Price & rate",
                              style: TextStyle(
                                  color: value.isSelected == 1
                                      ? Colors.white
                                      : Colors.black)))),
                  InkWell(
                      onTap: () => value.selectedCategory2(),
                      child: Container(
                          height: height * 0.1,
                          width: width * 0.28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: value.isSelected == 2
                                  ? const Color(0xff5465FF)
                                  : const Color(0xffF5F6F7),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(45),
                                  bottomRight: Radius.circular(45))),
                          child: Text("Distance",
                              style: TextStyle(
                                  color: value.isSelected == 2
                                      ? Colors.white
                                      : Colors.black))))
                ])),
            Expanded(
                child: value.isSelected == 0
                    ? const Category()
                    : value.isSelected == 1
                        ? const PriceRate()
                        : const Distance()),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff5465FF)),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  height: height * 0.06,
                  alignment: Alignment.center,
                  width: width * 0.4,
                  child: const Text("Clear all",
                      style:
                          TextStyle(color: Color(0xff5465FF), fontSize: 16))),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xff5465FF),
                      border: Border.all(color: const Color(0xff5465FF)),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  height: height * 0.06,
                  alignment: Alignment.center,
                  width: width * 0.4,
                  child: const Text("Apply",
                      style: TextStyle(color: Colors.white, fontSize: 16)))
            ])
          ]));
    });
  }
}
