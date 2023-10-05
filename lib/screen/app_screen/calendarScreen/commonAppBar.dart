import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:contactbook/common/theme/app_color.dart';


class CommonAppBar extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool isShow;
  final String? text;

  const CommonAppBar(
      {Key? key,
      this.onTap,
      this.isShow = false,
      this.text,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
              bottom: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        "assets/images/userSlider.png",
                        height: (33),
                      )),
                  const SizedBox(
                    width: (20),
                  ),
                  Text(
                    text!,
                    style: TextStyle(
                        letterSpacing: .5,
                        color: AppColor().whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              if (isShow)
                Image.asset(
                "assets/images/userSlider.png",
                  height: (44),
                  width: (44),
                  fit: BoxFit.fill,
                ),

            ],
          ),
        ),
        Divider(
          thickness: 3,
          color: AppColor().whiteColor.withOpacity(.2),
        ),
      ],
    );
  }
}
