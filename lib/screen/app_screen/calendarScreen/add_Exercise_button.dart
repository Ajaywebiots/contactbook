import 'package:contactbook/screen/app_screen/date_&_time/layouts/app_screem_util.dart';
import 'package:flutter/material.dart';

import '../../../common/theme/app_color.dart';

class AddExerciseButton extends StatelessWidget {
  final GestureTapCallback? onTap;

  const AddExerciseButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColor().completedColor1,
                AppColor().completedColor2,
                AppColor().completedColor3,
                AppColor().completedColor4,
              ],
            ),
            borderRadius: BorderRadius.circular(50)),
        child: Image.asset(
          "assets/images/userSlider.png",
          height: 15,
        ),
      ),
    );
  }
}
