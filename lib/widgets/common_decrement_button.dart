import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonDecrementInkWell extends StatelessWidget {
  final VoidCallback onTap;
  final String assetPath;

  const CommonDecrementInkWell({super.key, required this.onTap, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onTap,
      child: SizedBox(
        height: 23,
        width: 80,
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}