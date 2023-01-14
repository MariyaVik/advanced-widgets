import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skillbox_14_6/theme/color_palettes.dart';
import 'package:skillbox_14_6/theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          String themeName = colorPalettes.keys.toList()[index];
          return ListTile(
            onTap: () => ThemeProvider.of(context).changeTheme(themeName),
            leading: SizedBox(
                height: 40,
                width: 40,
                child: CustomPaint(
                    painter: ColorsWidget(
                        colorPalettes.values.toList()[index]['palette']))),
            title: Text(themeName),
            selected: ThemeProvider.of(context).theme ==
                colorPalettes[themeName]!['theme'],
          );
        },
        itemCount: 3,
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
