
import 'package:contactbook/common/theme/app_css.dart';
import 'package:contactbook/extensions/text_style_extensions.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorGrid extends StatelessWidget {




   const ColorGrid( {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black,
        elevation: 5,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Card(
              elevation: 5,
              child: Image.network("", height: 120, width: 200)),
          Text("",
                  style: AppCss.philosopherBold14.textColor(Colors.white),
                  overflow: TextOverflow.ellipsis)
              .padding(all: 5)
          // Text('₹${}',
          //     style: AppCss.philosopherBold14.textColor(Colors.white))
        ]));
  }
}
