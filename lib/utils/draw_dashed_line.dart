import 'package:flutter/material.dart';

/// Draws dashed lines lines between each point.
void drawDashedLine(
  Canvas canvas,
  Paint paint,
  List<Offset> points,
  List<int> dashPattern,
) {
  final localDashPattern = new List.from(dashPattern);

  // If an odd number of parts are defined, repeat the pattern to get an even
  // number.
  if (dashPattern.length % 2 == 1) {
    localDashPattern.addAll(dashPattern);
  }

  // Stores the previous point in the series.
  var previousSeriesPoint = points.first;

  var remainder = 0;
  var solid = true;
  var dashPatternIndex = 0;

  // Gets the next segment in the dash pattern, looping back to the
  // beginning once the end has been reached.
  var getNextDashPatternSegment = () {
    final dashSegment = localDashPattern[dashPatternIndex];
    dashPatternIndex = (dashPatternIndex + 1) % localDashPattern.length;
    return dashSegment;
  };

  // Array of points that is used to draw a connecting path when only a
  // partial dash pattern segment can be drawn in the remaining length of a
  // line segment (between two defined points in the shape).
  var remainderPoints;

  // Draw the path through all the rest of the points in the series.
  for (var pointIndex = 1; pointIndex < points.length; pointIndex++) {
    // Stores the current point in the series.
    final seriesPoint = points[pointIndex];

    if (previousSeriesPoint == seriesPoint) {
      // Bypass dash pattern handling if the points are the same.
    } else {
      // Stores the previous point along the current series line segment where
      // we rendered a dash (or left a gap).
      var previousPoint = previousSeriesPoint;

      var d = (previousSeriesPoint - seriesPoint).distance;

      while (d > 0) {
        var dashSegment =
            remainder > 0 ? remainder : getNextDashPatternSegment();
        remainder = 0;

        // Create a unit vector in the direction from previous to next point.
        final v = seriesPoint - previousPoint;
        final u = new Offset(v.dx / v.distance, v.dy / v.distance);

        // If the remaining distance is less than the length of the dash
        // pattern segment, then cut off the pattern segment for this portion
        // of the overall line.
        final distance = d < dashSegment ? d : dashSegment.toDouble();

        // Compute a vector representing the length of dash pattern segment to
        // be drawn.
        final nextPoint = previousPoint + (u * distance);

        // If we are in a solid portion of the dash pattern, draw a line.
        // Else, move on.
        if (solid) {
          if (remainderPoints != null) {
            // If we had a partial un-drawn dash from the previous point along
            // the line, draw a path that includes it and the end of the dash
            // pattern segment in the current line segment.
            remainderPoints.add(new Offset(nextPoint.dx, nextPoint.dy));

            final path = new Path()
              ..moveTo(remainderPoints.first.dx, remainderPoints.first.dy);

            for (var p in remainderPoints) {
              path.lineTo(p.dx, p.dy);
            }

            canvas.drawPath(path, paint);

            remainderPoints = null;
          } else {
            if (d < dashSegment && pointIndex < points.length - 1) {
              // If the remaining distance d is too small to fit this dash,
              // and we have more points in the line, save off a series of
              // remainder points so that we can draw a path segment moving in
              // the direction of the next point.
              //
              // Note that we don't need to save anything off for the "blank"
              // portions of the pattern because we still take the remaining
              // distance into account before starting the next dash in the
              // next line segment.
              remainderPoints = [
                new Offset(previousPoint.dx, previousPoint.dy),
                new Offset(nextPoint.dx, nextPoint.dy)
              ];
            } else {
              // Otherwise, draw a simple line segment for this dash.
              canvas.drawLine(previousPoint, nextPoint, paint);
            }
          }
        }

        solid = !solid;
        previousPoint = nextPoint;
        d = d - dashSegment;
      }

      // Save off the remaining distance so that we can continue the dash (or
      // gap) into the next line segment.
      remainder = -d.round();

      // If we have a remaining un-drawn distance for the current dash (or
      // gap), revert the last change to "solid" so that we will continue
      // either drawing a dash or leaving a gap.
      if (remainder > 0) {
        solid = !solid;
      }
    }

    previousSeriesPoint = seriesPoint;
  }
}
