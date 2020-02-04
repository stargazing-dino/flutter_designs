import 'package:designs/pages/punch_app/punch_app_home.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topHeight = MediaQuery.of(context).size.height / 3;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black,
              height: topHeight + kBorderRadiusLarge,
              width: double.infinity,
              child: CustomPaint(
                painter: CurvyLinePainter(),
                child: Center(
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PUNCH',
                          style: TextStyle(
                            fontSize: 56.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('Punch'),
                              Container(
                                width: 2,
                                height: 2,
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Colors.white,
                                ),
                              ),
                              Text('Earn'),
                              Container(
                                width: 2,
                                height: 2,
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Colors.white,
                                ),
                              ),
                              Text('Repeat'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: topHeight,
              left: 0,
              right: 0,
              bottom: 0,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(kPa, kPaLg, kPa, kPa),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                color: Colors.black,
                                size: 48.0,
                              ),
                              onPressed: Navigator.of(context).maybePop,
                            ),
                            Container(
                              height: double.infinity,
                              child: Center(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: null,
                              icon:
                                  Icon(Icons.block, color: Colors.transparent),
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    kBorderRadiusLarge,
                                  ),
                                ),
                                labelText: 'Full Name',
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    kBorderRadiusLarge,
                                  ),
                                ),
                                labelText: 'Phone Number',
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    kBorderRadiusLarge,
                                  ),
                                ),
                                labelText: 'Email id',
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    kBorderRadiusLarge,
                                  ),
                                ),
                                labelText: 'Password',
                              ),
                            ),
                            FlatButton(
                              color: Colors.black,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              shape: StadiumBorder(),
                              onPressed: () {},
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: kBottomNavigationBarHeight),
                    ],
                  ),
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(kBorderRadiusLarge),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pinkPath = Path()
      ..moveTo(-6, 60)
      ..relativeConicTo(-70, -140, size.width / 3, 0, .35)
      ..relativeConicTo(48, 55, size.width / 3, 0, .4)
      ..relativeConicTo(200, -160, size.width / 3 + 10, 0, .24);

    final purplePath = Path()
      ..moveTo(-6, 120)
      ..relativeConicTo(40, -180, size.width / 3, 0, .36)
      ..relativeConicTo(65, 80, size.width / 3, 0, .6)
      ..relativeConicTo(130, -100, size.width / 3 + 10, 0, .7);

    final bluePath = Path()
      ..moveTo(-6, 220)
      ..relativeConicTo(0, 120, size.width / 3, 0, .4)
      ..relativeConicTo(80, -100, size.width / 3, 0, .6)
      ..relativeConicTo(80, 140, size.width / 3 + 10, 0, 1);

    canvas.drawPath(
      pinkPath,
      Paint()
        ..color = kPink
        ..strokeWidth = 9.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawPath(
      purplePath,
      Paint()
        ..color = kPurple
        ..strokeWidth = 9.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawPath(
      bluePath,
      Paint()
        ..color = kBlue
        ..strokeWidth = 9.0
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
