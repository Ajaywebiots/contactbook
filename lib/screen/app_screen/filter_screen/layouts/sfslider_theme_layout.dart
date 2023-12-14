import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SFSliderThemeLayout extends StatelessWidget {
  final SfThumbShape thumbShape;
  final dynamic value;
  final ValueChanged<dynamic>? onChanged;
  const SFSliderThemeLayout({super.key, required this.thumbShape,required this.value,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
        data: SfSliderThemeData(
            inactiveTrackColor:
            const Color(0xffE5E8EA),
            activeLabelStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            inactiveLabelStyle:
            const TextStyle(
                fontFamily:
                "PoppinsRegular",
                fontSize: 10,
                fontWeight:
                FontWeight.normal,
                color: Colors.black),
            activeTrackColor: Colors.black),
        child: SfSlider(
          activeColor: Colors.black,
          min: 0.0,
          max: 30.0,
          interval: 5,
          showDividers: true,
          dividerShape:
          const SfDividerShape(),
          showLabels: true,
          showTicks: true,
          labelFormatterCallback:
              (dynamic actualValue,
              String formattedText) {
            switch (actualValue) {
              case 0:
                return '';
              case 5:
                return '05\nKm';
              case 10:
                return '10\nKm';
              case 15:
                return '15\nKm';
              case 20:
                return '20\nKm';
              case 25:
                return '25\nKm';
              case 30:
                return '30\nKm';
            }
            return actualValue.toString();
          },
          thumbShape: thumbShape,
          value: value,
          onChanged: onChanged,
        ));
  }
}
