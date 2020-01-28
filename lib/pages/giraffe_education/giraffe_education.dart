import 'package:designs/constants.dart';
import 'package:flutter/material.dart';

class GiraffeEducationPage extends StatefulWidget {
  @override
  _GiraffeEducationPageState createState() => _GiraffeEducationPageState();
}

class _GiraffeEducationPageState extends State<GiraffeEducationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _page = 0;
  PageController _pageController;
  final _children = [
    // HomeTab(),
    // LearnTab(),
    // ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newPage) => setState(() => this._page = newPage),
        children: _children,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 8.0, offset: Offset(0, 6.0))],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(kBorderRadius),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(kBorderRadius),
          ),
          child: BottomNavigationBar(
            currentIndex: _page,
            onTap: (index) => _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.flag),
                title: Text('Practice'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                title: Text('Learn'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.data_usage),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
