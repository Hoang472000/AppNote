import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;


class CircleTextWrapper extends StatelessWidget {
  const CircleTextWrapper({
    Key? key,
    required this.radius,
    required this.text,
    this.textStyleMain = const TextStyle(fontSize: 14),
    this.textStyleSub = const TextStyle(fontSize: 10),
    this.startAngle = 0,
  }) : super(key: key);
  final double radius;
  final String text;
  final double startAngle;
  final TextStyle textStyleMain;
  final TextStyle textStyleSub;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _Painter(radius, text.split('.')[0], text.split('.')[1],
            textStyleMain, textStyleSub),
      );
}

class _Painter extends CustomPainter {
  _Painter(this.radius, this.textMain, this.textSub, this.textStyleMain,
      this.textStyleSub,
      {this.padding = 10});

  final double radius;
  final String textMain;
  final String textSub;
  final double padding;
  final TextStyle textStyleSub;

  final TextStyle textStyleMain;
  final _textPainterMain = TextPainter(textDirection: TextDirection.ltr);
  final _textPainterSub = TextPainter(textDirection: TextDirection.ltr);
  final _textPainterDot = TextPainter(textDirection: TextDirection.ltr);
  final Paint _paint = Paint()
    ..blendMode
    ..color = Colors.redAccent
    ..strokeWidth = 2
    ..shader = RadialGradient(colors:  [
      Colors.deepOrange,
      Colors.pink,
    ],).createShader(Rect.fromCircle(
    center: Offset(-7,-5),
    radius: 20,
    ))
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, radius + padding, _paint);

    _textPainterMain.text = TextSpan(text: textMain, style: textStyleMain);
    _textPainterMain.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );
    _textPainterSub.text = TextSpan(text: textSub, style: textStyleSub);
    _textPainterSub.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );
    _textPainterDot.text = TextSpan(text: '.', style: textStyleSub);
    _textPainterDot.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );
    double y = -radius + _textPainterMain.height * .4;
    double x = math.sqrt(radius * radius - y * y) + _textPainterMain.width * .4;
    _textPainterMain.paint(
        canvas, Offset(-x, y - _textPainterMain.height * .6));

    double yDot = y - _textPainterMain.height / 5;
    double xDot = x - _textPainterMain.width;
    _textPainterDot.paint(
        canvas, Offset(-xDot, yDot - _textPainterDot.height * .6));

    double ySub = yDot;
    double xSub = xDot - _textPainterDot.width;
    _textPainterSub.paint(
        canvas, Offset(-xSub, ySub - _textPainterSub.height * .6));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
