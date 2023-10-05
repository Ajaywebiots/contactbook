import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/widgets/text_commom_widget1.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../provider/popup_list_provider.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PopUpListProvider>(builder: (context, value, child) {
      return Column(children: [
        const ListTile(title: Text("Category list")),
        TextFieldCommon1(
                hintText: "Search here",
                prefixIcon:
                    SvgPicture.asset("assets/svg/search.svg").padding(all: 10))
            .padding(horizontal: 15, vertical: 10),
        Expanded(
            child: ListView.builder(
                itemCount: value.categoryList.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: SmoothBorderRadius(cornerRadius: 5)),
                      child: ListTile(
                          trailing: InkWell(
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: ShapeDecoration(
                                      color: value.categoryList[index]['isCheck'] ==
                                              true
                                          ? const Color(0xff5465FF)
                                          : Colors.white,
                                      shape: SmoothRectangleBorder(
                                          side: BorderSide(
                                              color: value.categoryList[index]
                                                          ['isCheck'] ==
                                                      true
                                                  ? Colors.transparent
                                                  : const Color(0xffE5E8EA)),
                                          borderRadius:
                                              const SmoothBorderRadius.all(
                                                  SmoothRadius(
                                                      cornerRadius: 5,
                                                      cornerSmoothing: 1)))),
                                  child: value.categoryList[index]['isCheck'] == true
                                      ? SvgPicture.asset(
                                          "assets/svg/tick.svg",
                                          fit: BoxFit.scaleDown,
                                          height: 14,
                                          width: 14,
                                        )
                                      : null),
                              onTap: () => value.onCategoryListCheck(index)),
                          leading: SvgPicture.asset(value.categoryList[index]['icon']),
                          title: Text(value.categoryList[index]['title'])));
                }))
      ]);
    });
  }
}
