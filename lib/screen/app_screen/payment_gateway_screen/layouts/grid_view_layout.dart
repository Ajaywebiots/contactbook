import 'package:flutter/material.dart';

import '../../../../common/theme/app_css.dart';
import '../../../../config.dart';

class GridViewLayout extends StatelessWidget {
  final dynamic data;

  const GridViewLayout({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(Insets.i10),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(data['paymentImage'])),
            color: appColor(context).appTheme.black,
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => data['navigate']))));
  }
}
