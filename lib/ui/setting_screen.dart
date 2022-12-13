import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skillbox_14_6/theme/color_palettes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.purple,
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: SizedBox(
                height: 40,
                width: 40,
                child: CustomPaint(
                    painter:
                        ColorsWidget(colorPalettes.values.toList()[index]))),
            title: Text(colorPalettes.keys.toList()[index]),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}

class ColorsWidget extends CustomPainter {
  final colorPalette;

  ColorsWidget(this.colorPalette);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    // ..color = Colors.black;
    // canvas.drawOval(Offset.zero & size, paint);

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
