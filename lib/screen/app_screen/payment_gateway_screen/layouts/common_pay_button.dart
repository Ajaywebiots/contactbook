import 'package:flutter/material.dart';

import '../../../../common/theme/app_css.dart';

class CommonPayButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? text;
  const CommonPayButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            height: Insets.i50,
            width: double.infinity,
            color: Colors.black,
            child: Text(text!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: Insets.i25,
                    fontWeight: FontWeight.bold))));
  }
}
