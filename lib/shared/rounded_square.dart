import 'package:flutter/material.dart';

class RoundedSquare extends StatelessWidget {
  const RoundedSquare({
    this.color,
    this.aspectRatio = 1,
    this.child,
    this.onPressed,
    this.borderRadius,
    this.borderColor,
  });

  final Color color;
  final double aspectRatio;
  final Widget child;
  final void Function() onPressed;
  final BorderRadius borderRadius;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(5.0),
        border: Border.all(
          color: borderColor ?? Theme.of(context).dividerColor,
          width: 2.0,
        ),
      ),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          onTap: onPressed,
          child: child == null ? Container() : child,
        ),
      ),
    );
  }
}
