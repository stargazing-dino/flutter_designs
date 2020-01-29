import 'dart:math';

import 'package:designs/constants.dart';
import 'package:designs/pages/design_meetings/date_card.dart';
import 'package:designs/pages/design_meetings/members.dart';
import 'package:designs/pages/design_meetings/models/meeting.dart';
import 'package:designs/pages/design_meetings/tasks.dart';
import 'package:designs/pages/design_meetings/theme_constants.dart';
import 'package:designs/pages/design_meetings/wavey_painter.dart';
import 'package:designs/utils/draw_dashed_line.dart';
import 'package:designs/utils/map_range.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vMath;

class MeetingDetails extends StatelessWidget {
  MeetingDetails(this.meeting);

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 48.0,
            ),
            onPressed: Navigator.of(context).maybePop,
          ),
        ),
        primary: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 220,
            width: double.infinity,
            child: CustomPaint(painter: WaveyPainter()),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              kToolbarHeight + MediaQuery.of(context).viewPadding.top,
              0,
              kPaLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPaLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          meeting.title,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      DateCard(),
                      const SizedBox(height: kGapLarge * 2),
                      Headline(
                        'Members',
                        IconButton(
                            icon: Icon(Icons.more_vert), onPressed: () {}),
                      ),
                      const SizedBox(height: kGapSmall),
                    ],
                  ),
                ),
                SizedBox(height: 80, child: Members(meeting.members)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPaLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: kGapLarge * 2),
                      Headline('Tasks'),
                      SizedBox(height: kGapLarge),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Tasks(meeting.tasks),
                      ),
                      const SizedBox(height: kGapLarge * 2),
                      Headline('Productivity Graph'),
                      const SizedBox(height: kGapLarge),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ProductivityGraph(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductivityGraph extends StatelessWidget {
  ProductivityGraph()
      : noiseOne = vMath.SimplexNoise(Random(10)),
        noiseTwo = vMath.SimplexNoise(Random(12));

  final vMath.SimplexNoise noiseOne;
  final vMath.SimplexNoise noiseTwo;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(6.0);

    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        CustomPaint(painter: GraphPainter(noiseOne, noiseTwo)),
        Positioned(
          left: 150,
          right: 30,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 20.0,
                    spreadRadius: -4.0,
                    offset: Offset(2, 0),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text('5h'),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class GraphPainter extends CustomPainter {
  GraphPainter(this.noiseOne, this.noiseTwo);

  final vMath.SimplexNoise noiseOne;
  final vMath.SimplexNoise noiseTwo;

  @override
  void paint(Canvas canvas, Size size) {
    // In order to draw the shadow how they have it,
    // You'd need to get the derivitive o slope at that
    // point and check to see if it's positive.
    // The range of how positive would map into a amount
    // you'd take away from that point

    final purplePoints = _getRandomLine(size, noiseOne);
    final redPoints = _getRandomLine(size, noiseTwo);

    final purplePath = Path()..addPolygon(purplePoints, false);
    final redPath = Path()..addPolygon(redPoints, false);

    canvas.drawPath(
      purplePath,
      Paint()
        ..color = kPrimaryColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawPath(
      redPath,
      Paint()
        ..color = Colors.red[800]
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    drawDashedLine(
      canvas,
      Paint()
        ..color = kPrimaryColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
      [Offset(260, size.height), Offset(260, 0)],
      [0, 6, 0],
    );

    canvas.drawCircle(
      purplePoints[260],
      5,
      Paint()
        ..color = kPrimaryColor
        ..style = PaintingStyle.fill,
    );
  }

  List<Offset> _getRandomLine(Size size, vMath.SimplexNoise noise) {
    var purplePoints = <Offset>[];
    for (int i = 0; i < size.width; i++) {
      final x = i.toDouble() / size.width;
      final y = noise.noise2D(x, 1) * size.height;

      purplePoints.add(Offset(i.toDouble(), y));
    }

    final maxY = purplePoints.map((point) => point.dy).reduce(max);
    final minY = purplePoints.map((point) => point.dy).reduce(min);

    return purplePoints.map((point) {
      return Offset(point.dx, mapRange(point.dy, minY, maxY, 0, size.height));
    }).toList();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Headline extends StatelessWidget {
  Headline(this.text, [this.action]);

  final String text;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.title.copyWith(
                  color: kAccentColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        if (action != null) action,
      ],
    );
  }
}
