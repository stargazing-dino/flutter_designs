import 'package:designs/constants.dart';
import 'package:flutter/material.dart';

class FundamentalJavascript extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: Navigator.of(context).maybePop,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPa),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Fundamental Javascript',
                style: textTheme.title.copyWith(fontSize: 24.0),
              ),
              const SizedBox(height: kGap),
              Text(
                'By Vlad Ermakov',
                style: textTheme.caption.copyWith(fontSize: 16.0),
              ),
              const SizedBox(height: kGapLarge),
              SizedBox(
                height: 240,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: Image.asset(
                    'assets/tech_education/back_of_man_js.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: kGapLarge),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 18.0, height: 1.5),
                  children: [
                    TextSpan(
                      text: 'JavaScript',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ', often abbreviated as JS, is a high-level, just-in-time compiled, multi-paradigm programming language.',
                      style: TextStyle(color: textTheme.caption.color),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kGapLarge),
              Row(
                children: <Widget>[
                  Text(
                    'Course Details',
                    style: textTheme.title.copyWith(fontSize: 26.0),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: kPa,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).dividerColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(kBorderRadiusSmall),
                      ),
                    ),
                    child: Row(children: <Widget>[
                      Icon(Icons.timer, color: Colors.orange),
                      const SizedBox(width: kGap),
                      Text('1 hour, 20 mins')
                    ]),
                  )
                ],
              ),
              const SizedBox(height: kGapLarge),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ModuleCard(
                        title: 'What is JavaScript?',
                        category: 'Introduce',
                        time: '20 min',
                        icon: Icons.note,
                      ),
                    ),
                    const SizedBox(width: kGapLarge),
                    Expanded(
                      child: ModuleCard(
                        title: 'Basic training',
                        category: 'Application',
                        time: '65 min',
                        icon: Icons.settings,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    @required this.title,
    @required this.category,
    @required this.time,
    @required this.icon,
  });

  final String title;
  final String category;
  final String time;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPa, vertical: kPaLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: Colors.green[600]),
                const SizedBox(width: kGap),
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.green[600],
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 18.0)),
                const SizedBox(height: kGap),
                Text(time, style: Theme.of(context).textTheme.caption),
              ],
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: kGap),
                Text(
                  'Start',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
