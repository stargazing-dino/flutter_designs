import 'package:designs/constants.dart';
import 'package:designs/pages/tech_education/fundamental_javascript.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TechEducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton.icon(
                label: Text('Go Back'),
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kPaLg,
              horizontal: kPa,
            ),
            child: TechEducationBody(),
          )
        ],
      ),
    );
  }
}

class TechEducationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final darkTextColor = Colors.grey[900];

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello,',
                  style: textTheme.caption.copyWith(fontSize: 22.0),
                ),
                Text(
                  'Saepul, R.',
                  style: textTheme.display1.copyWith(
                    color: darkTextColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: SvgPicture.asset(
                'assets/tech_education/profile_shot_blue.svg',
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            )
          ],
        ),
        const SizedBox(height: kGapLarge),
        SizedBox(height: 70, child: SearchBar()),
        const SizedBox(height: kGapLarge),
        SizedBox(
          height: 240,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: SvgPicture.asset(
                  'assets/tech_education/woman_with_phone_purple.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPaLg),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'What do you\nwant to learn\ntoday?',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              color: darkTextColor,
                            ),
                          ),
                          Spacer(),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                kBorderRadiusSmall,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: kPa,
                              horizontal: kPaLg,
                            ),
                            onPressed: () {},
                            color: Colors.orange,
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: kGapLarge),
        const SizedBox(height: kGapLarge),
        Text(
          'Last Seen Courses',
          style: textTheme.headline.copyWith(
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
        ),
        const SizedBox(height: kGapLarge),
        Column(
          children: <Widget>[
            ColorTile(
              color: Colors.green.withOpacity(0.1),
              title: 'Fundamental JavaScript',
              subtitle: '1 hour, 20 min',
              courseUrlSvg: 'assets/tech_education/graduation_cap.svg',
              progress: 0.75,
            ),
            const SizedBox(height: kPa),
            ColorTile(
              color: Colors.orange.withOpacity(0.1),
              title: 'Story of my life',
              subtitle: '4 hours, 30 min',
              courseUrlSvg: 'assets/tech_education/chemistry_set.svg',
              progress: 0.5,
            ),
            const SizedBox(height: kPa),
            ColorTile(
              color: Colors.blue.withOpacity(0.1),
              title: 'Pass the CNES',
              subtitle: '5 hours',
              courseUrlSvg: 'assets/tech_education/laptop_cert.svg',
              progress: 0.2,
            ),
          ],
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kPaLg, kPa, kPa, kPa),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              size: 32.0,
              color: Colors.orange[700],
            ),
            const SizedBox(width: kGap),
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            VerticalDivider(
              thickness: 2.0,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  const ColorTile({
    @required this.title,
    @required this.subtitle,
    @required this.color,
    @required this.courseUrlSvg,
    @required this.progress,
  });

  final String title;
  final String subtitle;
  final Color color;
  final String courseUrlSvg;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => FundamentalJavascript()),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: kPa,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: SvgPicture.asset(
            courseUrlSvg,
            height: 60.0,
            width: 60.0,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16.0),
        ),
        trailing: SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              CircleAvatar(backgroundColor: Colors.white),
              CircularProgressIndicator(
                value: progress,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
              Icon(Icons.play_arrow, color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
