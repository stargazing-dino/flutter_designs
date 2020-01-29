import 'package:designs/pages/design_meetings/theme_constants.dart';
import 'package:flutter/material.dart';

class WaveyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = 36.0;

    final path = Path()
      ..relativeLineTo(size.width, 0)
      ..relativeLineTo(0, size.height + radius)
      ..relativeArcToPoint(
        Offset(-radius, -radius),
        clockwise: false,
        radius: Radius.circular(radius),
      )
      ..relativeLineTo(-size.width + radius * 2, 0)
      ..relativeArcToPoint(
        Offset(-radius, -radius),
        clockwise: true,
        radius: Radius.circular(radius),
      )
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..color = kPrimaryColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
