import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      railElevation: RailElevation.Divider,
      drawerHeader: DrawerHeader(
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(0.0),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromRGBO(250, 225, 54, 1.0),
              image: DecorationImage(
                  image: AssetImage('assets/img/hubbellLogo.png'))),
        ),
      ),
      appBar: AppBar(
        title: Text('Hubbell Calculator'),
      ),
      currentIndex: _pageIndex,
      destinations: [
        AdaptiveScaffoldDestination(
            title: 'Home', icon: Icons.home, destination: null),
        AdaptiveScaffoldDestination(
            title: 'Entries', icon: Icons.list, destination: null),
        AdaptiveScaffoldDestination(
            title: 'Calculadora', icon: Icons.calculate, destination: null)
      ],
      body: _pageAtIndex(context, _pageIndex),
      onNavigationIndexChange: (newIndex) {
        setState(() {
          _pageIndex = newIndex;
        });
      },
    );
  }

  static Widget _pageAtIndex(BuildContext context, int index) {
    if (index == 0) {
      return Center(child: Text('Im the home page'));
    }

    if (index == 1) {
      return Center(child: Text('I will list entries'));
    }

    return InputPage(context);
  }
}
