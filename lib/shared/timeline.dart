import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    @required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.controller,
    this.lineColor = Colors.grey,
    this.lineGap = 4.0,
    this.indicatorColor = Colors.blue,
    this.indicatorSize = 30.0,
    this.indicatorStyle = PaintingStyle.stroke,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length);

  /// The [Widget]s shown in the main portion of the timeline event
  final List<Widget> children;

  /// A `List` of [Widget]s matching [children] length that contains the
  /// elements to be displayed alongisde [children]. These items will have their
  /// width and height constrained by [indicatorSize].
  final List<Widget> indicators;

  /// Whether the timeline is displayed on the left or right side of [children]
  final bool isLeftAligned;

  /// The vertical spacing between timeline events.
  final double itemGap;

  /// The horizontal spacing between the event timeline and the [children]
  final double gutterSpacing;

  /// See [ListView]
  final EdgeInsets padding;

  /// See [ListView]
  final ScrollPhysics physics;

  /// See [ListView]
  final bool shrinkWrap;

  /// See [ListView]
  final bool primary;

  /// See [ListView]
  final bool reverse;

  /// See [ListView]
  final ScrollController controller;

  /// See [ListView]
  final int itemCount;

  /// The color of the lines between indicators in the event timeline
  final Color lineColor;

  /// The amoung of spacing between the line and the indicator
  final double lineGap;

  /// If [indicators] is not set, a default circle will be set.
  /// [indicatorColor] defines the color of that circle.
  final Color indicatorColor;

  /// The size of the [indicators]
  final double indicatorSize;

  /// A painting style that defines the indicator.
  /// For unfilled circles, try setting to `PaintingStyle.stroke`
  final PaintingStyle indicatorStyle;

  /// What kind of stroke cap to use on the event timeline lines
  final StrokeCap strokeCap;

  /// The width of the lines used in the event timeline lines
  final double strokeWidth;

  /// The style used for painting the event timeline lines
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];

        Widget indicator;
        if (indicators != null) indicator = indicators[index];

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    @required this.hideDefaultIndicator,
    @required this.indicatorColor,
    @required this.indicatorStyle,
    @required this.indicatorSize,
    @required this.lineGap,
    @required this.strokeCap,
    @required this.strokeWidth,
    @required this.style,
    @required this.lineColor,
    @required this.isFirst,
    @required this.isLast,
    @required this.itemGap,
  })  : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
