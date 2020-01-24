import 'package:flutter/material.dart';

class StubShape extends ShapeBorder {
  const StubShape({
    this.borderColor = Colors.transparent,
    this.borderStrokeWidth = 0.0,
    this.borderRadius,
    this.radius = 10,
    this.isTop = true,
  }) : assert(radius != null);

  final Color borderColor;
  final double borderStrokeWidth;
  final double radius;
  final BorderRadiusGeometry borderRadius;
  final bool isTop;

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final resolvedRadius =
        (borderRadius ?? BorderRadius.circular(16.0)).resolve(textDirection);
    final height = rect.height;
    final width = rect.width;

    if (isTop) {
      return Path()
        ..moveTo(rect.left + resolvedRadius.topLeft.x, rect.top)
        ..relativeArcToPoint(
          Offset(
            -resolvedRadius.topLeft.x,
            resolvedRadius.topLeft.y,
          ),
          clockwise: false,
          radius: resolvedRadius.topLeft,
        )
        ..relativeLineTo(0, height - radius - resolvedRadius.topLeft.y)
        ..relativeArcToPoint(
          Offset(radius, radius),
          clockwise: true,
          radius: Radius.circular(radius),
        )
        ..relativeLineTo(width - radius * 2, 0)
        ..relativeArcToPoint(
          Offset(radius, -radius),
          clockwise: true,
          radius: Radius.circular(radius),
        )
        ..relativeLineTo(0, -height + radius + resolvedRadius.topRight.y)
        ..relativeArcToPoint(
          Offset(
            -resolvedRadius.topRight.x,
            -resolvedRadius.topRight.y,
          ),
          clockwise: false,
          radius: resolvedRadius.topRight,
        )
        ..close();
    } else {
      return Path()
        ..moveTo(rect.left + radius, rect.top)
        ..relativeArcToPoint(
          Offset(
            -radius,
            radius,
          ),
          clockwise: true,
          radius: Radius.circular(radius),
        )
        ..relativeLineTo(0, height - radius - resolvedRadius.bottomLeft.y)
        ..relativeArcToPoint(
          Offset(resolvedRadius.bottomLeft.x, resolvedRadius.bottomLeft.y),
          clockwise: false,
          radius: resolvedRadius.bottomLeft,
        )
        ..relativeLineTo(
          width - resolvedRadius.bottomLeft.x - resolvedRadius.bottomRight.x,
          0,
        )
        ..relativeArcToPoint(
          Offset(resolvedRadius.bottomRight.x, -resolvedRadius.bottomRight.y),
          clockwise: false,
          radius: resolvedRadius.bottomRight,
        )
        ..relativeLineTo(
          0,
          -height + radius + resolvedRadius.bottomRight.y,
        )
        ..relativeArcToPoint(
          Offset(-radius, -radius),
          clockwise: true,
          radius: Radius.circular(radius),
        )
        ..close();
    }
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    final path = Path()..addPath(getOuterPath(rect), Offset.zero);

    canvas.drawPath(
      path,
      Paint()
        ..color = borderColor
        ..strokeWidth = borderStrokeWidth
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
