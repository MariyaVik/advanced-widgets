import 'dart:math';

import 'package:flutter/material.dart';

class ColorsCircleWidget extends CustomPainter {
  ColorsCircleWidget({required this.colorPalette});
  final colorPalette;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    var start = 0.0;
    var step = 2 * pi / colorPalette.length;
    for (var color in colorPalette) {
      paint.color = color;
      canvas.drawArc(Offset.zero & size, start, step, true, paint);
      start += step;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
