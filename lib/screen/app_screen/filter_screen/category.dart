import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/widgets/text_commom_widget1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/provider/popup_list_provider.dart';

import '../../../common/assets/index.dart';
import 'layouts/categories_layout.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PopUpListProvider>(builder: (context, value, child) {
      return Column(children: [
        Row(children: [Text(appFonts.categoryList)])
            .padding(horizontal: 15, vertical: 20),
        TextFieldCommon1(
                hintText: appFonts.searchHere,
                prefixIcon:
                    SvgPicture.asset(eSvgAssets.search).padding(all: 10))
            .padding(horizontal: 15, vertical: 10),
        Expanded(
            child: ListView.builder(
                itemCount: value.categoryList.length,
                itemBuilder: (context, index) {
                  return CategoriesLayout(
                      data: value.categoryList[index],
                      onTap: () => value.onCategoryListCheck(index));
                }))
      ]);
    });
  }
}
