import 'package:designs/pages/medical_quiz/palette.dart';
import 'package:designs/shared/timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalQuiz extends StatefulWidget {
  @override
  _MedicalQuizState createState() => _MedicalQuizState();
}

class _MedicalQuizState extends State<MedicalQuiz> {
  final controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.notoSans();
    final size = MediaQuery.of(context).size;
    final topHeight = size.height / 2.5;
    final leftRadius = 460.0;
    final rightRadius = 500.0;

    return DefaultTextStyle(
      style: style,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: kGrey,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: Navigator.of(context).maybePop,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: topHeight,
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Positioned(
                    right: -rightRadius * .5,
                    top: topHeight - rightRadius,
                    child: Container(
                      height: rightRadius,
                      width: rightRadius,
                      decoration: BoxDecoration(
                        color: kSecondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -leftRadius * .3,
                    top: topHeight - leftRadius - 40.0,
                    child: Container(
                      height: leftRadius,
                      width: leftRadius,
                      decoration: BoxDecoration(
                        color: kPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SafeArea(
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Hello, Rex',
                            style: style.copyWith(
                              fontSize: 46.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Continue quiz 1?',
                            style: style.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: TextField(
                                controller: controller,
                                style: style.copyWith(color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search questions',
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                    child: Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            16.0,
                            16.0,
                            8.0,
                            16.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Take Placement Test',
                                      style: style.copyWith(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.timelapse,
                                              size: 16.0,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .color,
                                            ),
                                          ),
                                          WidgetSpan(child: SizedBox(width: 4)),
                                          TextSpan(
                                            text: '15 minutes',
                                          )
                                        ],
                                      ),
                                      style: style.copyWith(
                                        fontSize: 14.0,
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              IconButton(
                                iconSize: 48.0,
                                icon: Icon(Icons.play_circle_filled),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: SizedBox(
                                width: size.width / 2,
                                child: OutlineButton(
                                  shape: StadiumBorder(),
                                  onPressed: () {},
                                  child: Text('Start Studying'),
                                ),
                              ),
                            ),
                            Timeline(
                              gutterSpacing: 8.0,
                              children: <Widget>[
                                Text(
                                    'Voluptatem minima ut veritatis rerum esse fuga aut. Reiciendis hic debitis aperiam recusandae et?'),
                                Text(
                                    'Reiciendis hic debitis aperiam recusandae et. Aut accusantium sint consequatur temporibus rem qui harum?'),
                                Text('Sapiente at ea velit voluptas?'),
                                Text(
                                    'Possimus tempora possimus qui. Sequi dolore accusamus dignissimos nam quos non.'),
                              ],
                              indicators: <Widget>[
                                Icon(Icons.help_outline),
                                Icon(Icons.help_outline),
                                Icon(Icons.help_outline),
                                Icon(Icons.help_outline),
                              ],
                            ),
                            Spacer(),
                            Center(
                                child: Text(
                              'Plus 240 more...',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(fontSize: 16.0),
                            )),
                            Spacer(),
                            const SizedBox(height: kBottomNavigationBarHeight),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: kSecondary,
          selectedIconTheme: IconThemeData(color: kSecondary),
          selectedLabelStyle: TextStyle(color: kSecondary),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Study'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add_check),
              title: Text('Exam'),
            ),
          ],
        ),
      ),
    );
  }
}
