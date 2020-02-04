import 'package:designs/pages/punch_app/auth_page.dart';
import 'package:flutter/material.dart';

final kPurple = Color(0xff6B18FF);
final kPink = Color(0xffFF3EAA);
final kBlue = Color(0xff30CDFF);

class PunchAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: kPurple,
              size: 48.0,
            ),
            onPressed: Navigator.of(context).maybePop,
          ),
        ),
        primary: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: size.width / 5,
            top: size.height / 6,
            child: Material(
              color: kPurple,
              shape: CircleBorder(),
              child: SizedBox(height: 80, width: 80),
            ),
          ),
          Positioned(
            right: -size.width / 7,
            top: size.height / 4,
            child: Material(
              color: kPink,
              shape: CircleBorder(),
              child: SizedBox(height: 140, width: 140),
            ),
          ),
          Positioned(
            left: size.width / 3,
            bottom: size.height / 4,
            child: Material(
              color: kBlue,
              shape: CircleBorder(),
              child: SizedBox(height: 36, width: 36),
            ),
          ),
          Center(
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Stack(
                        fit: StackFit.passthrough,
                        children: <Widget>[
                          CustomPaint(painter: DotsPainter()),
                          ShaderMask(
                            blendMode: BlendMode.srcOut,
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                colors: [Theme.of(context).canvasColor],
                                stops: [0.0],
                              ).createShader(bounds);
                            },
                            child: Text(
                              'PUNCH ',
                              style: TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 4.0),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Punch',
                            style: TextStyle(color: kPink),
                          ),
                          Container(
                            width: 2,
                            height: 2,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Earn',
                            style: TextStyle(color: kPurple),
                          ),
                          Container(
                            width: 2,
                            height: 2,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Repeat',
                            style: TextStyle(color: kBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AuthPage()),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTRB(1, 0, size.width, size.height));
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.black);

    canvas.drawCircle(
      Offset.zero,
      20.0,
      Paint()..color = Colors.red,
    );
    canvas.drawCircle(
      Offset(size.width / 3, size.height),
      28.0,
      Paint()..color = Colors.purple,
    );
    canvas.drawCircle(
      Offset(size.width / 1.5, 0),
      28.0,
      Paint()..color = Colors.deepPurple[800],
    );
    canvas.drawCircle(
      Offset(size.width, size.height),
      28.0,
      Paint()..color = Colors.lightBlue[700],
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
