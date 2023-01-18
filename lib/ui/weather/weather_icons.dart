import 'package:flutter/material.dart';

class WeatherIndicatorWidget extends StatelessWidget {
  const WeatherIndicatorWidget(
      {required this.size, required this.currentValue, super.key});
  final double size;
  final double currentValue;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: WeatherIndicator(coef: currentValue),
        ),
      ),
    );
  }
}

class WeatherIndicator extends CustomPainter {
  double coef;
  WeatherIndicator({required this.coef});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.teal);
    // ------------------------Солнце----------------------------------
    double opacitySun = coef >= 0.5 ? 1 : coef * 2;
    const scale = 1 / 3;
    final paintSun = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.yellow.withOpacity(opacitySun);
    canvas.drawCircle(Offset(size.width / 2, size.height * scale),
        size.height * scale, paintSun);

    // ------------------------Облако----------------------------------
    int shade = coef >= 0.5 ? 250 : (400 * coef + 50).toInt();
    double opacityCloud = coef <= 0.5 ? 1 : (-2) * coef + 2;
    const icon = Icons.cloud;
    final textSpan = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: size.height,
        fontFamily: icon.fontFamily,
        color: Color.fromRGBO(shade, shade, shade, opacityCloud),
      ),
    );
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final offset =
        Offset(size.width / 2 - textPainter.size.width / 2, size.height / 1500);
    textPainter.paint(canvas, offset);

    // ------------------------Дождь----------------------------------
    double opacityRain = coef >= 0.5 ? 0 : 1 - coef * 2;
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
