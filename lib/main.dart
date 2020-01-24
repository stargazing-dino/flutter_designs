import 'package:designs/pages/airline/airline.dart';
import 'package:designs/pages/food.dart';
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
        '/food': (_) => FoodPage(),
        '/airline': (_) => AirlinePage(),
      },
    );
  }
}

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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: <Widget>[
            PageButton(title: 'Food', to: '/food'),
            PageButton(title: 'Airline', to: '/airline'),
            PageButton(title: 'Food', to: '/food'),
            PageButton(title: 'Food', to: '/food'),
            PageButton(title: 'Food', to: '/food'),
            PageButton(title: 'Food', to: '/food'),
            PageButton(title: 'Food', to: '/food'),
          ],
        ),
      ),
    );
  }
}

class PageButton extends StatelessWidget {
  const PageButton({this.title, this.to})
      : assert(title != null),
        assert(to != null);

  final String to;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16.0),
      color: Colors.blue,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, to),
        child: Padding(padding: const EdgeInsets.all(16.0), child: Text(title)),
      ),
    );
  }
}
