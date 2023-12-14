import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceRateLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback onTap;

  const PriceRateLayout({super.key, this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
            borderRadius: SmoothBorderRadius(cornerRadius: 10)),
        child: ListTile(
            leading: Text(data['rate']),
            title: SvgPicture.asset(data['icon'],
                alignment: Alignment.centerLeft, height: 14),
            trailing: InkWell(
                onTap: onTap,
                child: data['isRated'] == true
                    ? Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff5465FF)
                            .withOpacity(0.18)),
                    child: const Icon(Icons.circle,
                        color: Color(0xff5465FF), size: 13))
                    : Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffE5E8EA)))))));
  }
}
