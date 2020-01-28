import 'package:designs/constants.dart';
import 'package:designs/pages/airline_seats/airline.dart';
import 'package:designs/pages/giraffe_education/giraffe_education.dart';
import 'package:designs/pages/mia_user_profile/mia_user_profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
      routes: {
        '/mia_user_profile': (_) => MiaUserProfilePage(),
        '/airline_seats': (_) => AirlineSeatsPage(),
        '/giraffe': (_) => GiraffeEducationPage(),
      },
    );
  }
}

class UserProfilePage {}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(kPa),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: <Widget>[
            PageButton(title: 'Mia\'s Profile', to: '/mia_user_profile'),
            PageButton(title: 'Airline Seats', to: '/airline'),
            PageButton(title: 'Giraffe', to: '/giraffe'),
          ],
        ),
      ),
    );
  }
}

class PageButton extends StatelessWidget {
  const PageButton({
    @required this.title,
    @required this.to,
    this.description = '',
  })  : assert(title != null),
        assert(to != null);

  final String to;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, to),
        child: Padding(
          padding: const EdgeInsets.all(kPa),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.title.copyWith(),
              ),
              const SizedBox(height: kGapSmall),
              Expanded(
                child: Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 16.0),
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
