import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:ui' as ui;
import 'package:syncfusion_flutter_core/theme.dart';


class CustomThumbShape extends SfThumbShape {
  final ui.Image image;

  CustomThumbShape(this.image);

  // Converts degree to radians.
  double? degreeToRadians(num deg) => deg * (pi / 180.0);

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox? child,
        dynamic currentValue,
        SfRangeValues? currentValues,
        required SfSliderThemeData themeData,
        required Animation<double> enableAnimation,
        required Paint? paint,
        required RenderBox parentBox,
        required TextDirection textDirection,
        required SfThumb? thumb}) {
    final canvas = context.canvas;
    final imageWidth = image.width;
    final imageHeight = image.height;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      center.dy - (imageHeight / 1.2),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    canvas.drawImage(image, imageOffset, paint);
  }
}
