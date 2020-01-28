import 'package:flutter/material.dart';

class PlanePainter extends CustomPainter {
  const PlanePainter({
    this.strokeColor = Colors.grey,
    this.backgroundColor = Colors.transparent,
  });

  final Color strokeColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final offScreen = 4.0;
    final padding = 24.0;
    final toWing = 128.0;
    final wingDistance = 40.0;
    final wingWidth = 230.0;
    final toBottom = size.height - toWing - wingWidth;

    final leftPath = Path()
      // Left Side
      ..moveTo(padding, -offScreen)
      ..relativeLineTo(0, toWing)
      ..relativeLineTo(-padding - offScreen, wingDistance)
      ..relativeLineTo(0, wingWidth)
      ..relativeLineTo(padding + offScreen, -wingDistance)
      ..relativeLineTo(0, toBottom + offScreen)
      // Bottom Side
      ..relativeLineTo(size.width - padding * 2, 0)
      // Right Side
      ..relativeLineTo(0, -toBottom - offScreen)
      ..relativeLineTo(padding + offScreen, wingDistance)
      ..relativeLineTo(0, -wingWidth)
      ..relativeLineTo(-padding - offScreen, -wingDistance)
      ..relativeLineTo(0, -toWing - offScreen)
      ..relativeLineTo(-size.width + padding * 2, 0)
      ..close();

    canvas.drawPath(
      leftPath,
      Paint()
        ..color = backgroundColor
        ..strokeWidth = 3
        ..style = PaintingStyle.fill,
    );
    canvas.drawPath(
      leftPath,
      Paint()
        ..color = strokeColor
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
