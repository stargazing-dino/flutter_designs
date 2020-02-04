import 'package:designs/pages/punch_app/punch_app_home.dart';
import 'package:designs/pages/punch_app/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final slides = <Slide>[
      Slide(
        'Organize, find and enjoy your\nloyalty cards in a more modern\nand dynamic way.',
        Icons.credit_card,
      ),
      Slide(
        'Earn points for every purchase\nand spend them for cashback\nor unique rewards.',
        Icons.score,
      ),
      Slide(
        'Every transaction is automatically\napplied to your account\nwithout manual setup',
        Icons.attach_money,
      ),
    ];
    final topHeight = MediaQuery.of(context).size.height / 3;

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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Container(
              color: kPurple,
              height: topHeight + kBorderRadiusLarge,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -100,
                    top: -50,
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: kPink,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -40,
                    bottom: -80,
                    child: Container(
                      height: 260,
                      width: 260,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: kBlue,
                      ),
                    ),
                  ),
                  Center(
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
                ],
              ),
            ),
            Positioned(
              top: topHeight,
              left: 0,
              right: 0,
              bottom: 0,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.all(kPa),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                              child: PageView.builder(
                                controller: controller,
                                itemBuilder: (_, i) => slides[i],
                                itemCount: slides.length,
                              ),
                            ),
                            const SizedBox(height: kGapLarge),
                            Center(
                              child: SmoothPageIndicator(
                                controller: controller, // PageController
                                count: slides.length,
                                effect: WormEffect(
                                  dotHeight: 6,
                                  dotWidth: 6,
                                ), // your preferred effect
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: kGapLarge * 2),
                      FlatButton(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        shape: StadiumBorder(),
                        onPressed: _toSignUp,
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: kGapLarge),
                      OutlineButton(
                        onPressed: _toSignUp,
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        shape: StadiumBorder(),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                        ),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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

  _toSignUp() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpPage()));
  }
}

class Slide extends StatelessWidget {
  Slide(this.text, this.iconData);

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final size = 80.0;
    final shadowPadding = 8.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Icon(
                iconData,
                color: kPink,
                size: size - shadowPadding,
              ),
              Positioned(
                child: Icon(
                  iconData,
                  color: kBlue,
                  size: size - shadowPadding,
                ),
                left: shadowPadding,
                top: shadowPadding,
              ),
            ],
          ),
        ),
        Text(
          'Organize, find and enjoy your\nloyalty cards in a more modern\nand dynamic way.',
          style: TextStyle(
            fontSize: 18.0,
            height: 1.3,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
