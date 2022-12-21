import 'package:flutter/material.dart';

class SunCloudRain extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // ------------------------Солнце----------------------------------
    double opacitySun = 1;
    const scale = 1 / 3;
    final paintSun = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.yellow.withOpacity(opacitySun);
    canvas.drawCircle(Offset(size.width / 2, size.height * scale),
        size.height * scale, paintSun);

    // ------------------------Облако----------------------------------
    int shade = 500;
    const icon = Icons.cloud;
    final textSpan = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: size.height,
        fontFamily: icon.fontFamily,
        color: Colors.grey[shade],
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final offset = Offset(0, size.height / 1500);
    textPainter.paint(canvas, offset);

    // ------------------------Дождь----------------------------------
    double opacityRain = 1;
    final paintRain = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6.0
      ..color = Colors.blue.withOpacity(opacityRain);

    var dropOne = Path()
      ..moveTo(size.width * 2 / 10, size.height * 17 / 20)
      ..lineTo(size.width * 1.5 / 10, size.height * 19 / 20);
    var dropTwo = Path()
      ..moveTo(size.width * 5 / 10, size.height * 17 / 20)
      ..lineTo(size.width * 4.5 / 10, size.height * 19 / 20);
    var dropThree = Path()
      ..moveTo(size.width * 8 / 10, size.height * 17 / 20)
      ..lineTo(size.width * 7.5 / 10, size.height * 19 / 20);

    canvas.drawPath(dropOne, paintRain);
    canvas.drawPath(dropTwo, paintRain);
    canvas.drawPath(dropThree, paintRain);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
