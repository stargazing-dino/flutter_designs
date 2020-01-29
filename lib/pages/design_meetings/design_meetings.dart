import 'package:designs/constants.dart';
import 'package:designs/pages/design_meetings/meeting_card.dart';
import 'package:designs/pages/design_meetings/mock_meetings.dart';
import 'package:designs/pages/design_meetings/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// background
// https://dribbble.com/shots/9565876/attachments/1593881?mode=media
class DesignMeetingsPage extends StatefulWidget {
  @override
  _DesignMeetingsPageState createState() => _DesignMeetingsPageState();
}

class _DesignMeetingsPageState extends State<DesignMeetingsPage> {
  PageController _controller;
  int selectedPage = 0;

  @override
  void initState() {
    _controller = PageController(viewportFraction: 1 / 3)
      ..addListener(() {
        if (_controller.page.toInt() != selectedPage) {
          setState(() {
            selectedPage = _controller.page.toInt();
          });
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Theme(
      data: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: kPrimaryColor,
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
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {},
              child: Container(
                height: 70,
                width: 70,
                child: Icon(Icons.add, size: 30),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange,
                      blurRadius: 20.0,
                      spreadRadius: -2.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.orange,
          selectedIconTheme: IconThemeData(color: Colors.orange),
          selectedLabelStyle: TextStyle(color: Colors.orange),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('hi'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('hi'),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/design_meetings/couple_meeting.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(kBorderRadiusLarge),
                    ),
                    color: kBackgroundColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    kPaLg + kPaLg,
                    0,
                    kPaLg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kPaLg),
                        child: IntrinsicHeight(
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Hi '),
                                        TextSpan(
                                          text: 'Rex!',
                                          style:
                                              TextStyle(color: kPrimaryColor),
                                        ),
                                      ],
                                    ),
                                    style: textTheme.title.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26.0,
                                    ),
                                  ),
                                  const SizedBox(height: kGapSmall),
                                  Text(
                                    'You have 4 meetings today',
                                    style: textTheme.title.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: kAccentColor,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  kBorderRadius,
                                ),
                                child: Container(
                                  color: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/design_meetings/black_haired_guy.svg',
                                    height: 70.0,
                                    width: 70.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 250.0,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(
                            kGapLarge * 2,
                            kGapLarge * 2,
                            kGapLarge,
                            kGapLarge,
                          ),
                          physics: PageScrollPhysics(),
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: meetings
                                .asMap()
                                .map((index, meeting) {
                                  return MapEntry(
                                    index,
                                    MeetingCard(
                                      meetings[index],
                                      index == selectedPage,
                                    ),
                                  );
                                })
                                .values
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
