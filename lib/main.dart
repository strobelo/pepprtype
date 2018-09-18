import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard.dart';
import 'stats.dart';
import 'login.dart';
import 'theme.dart';

void main() => runApp(new MyApp());

Map<int, Widget> screenMap = <int, Widget> {
  0: new DashboardScreen(),
  1: new StatsScreen(),
}; 


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cunts',
      routes: {
        '/': (context) => new LoginScreen(),
        '/home': (context) => new Home(),
      },
      theme: pinkTheme(),
      
    );
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              title: new Text('Dashboard'),
              icon: new Icon(Icons.home),
            ),
            new BottomNavigationBarItem(
              title: new Text('Stats'),
              icon: new Icon(Icons.insert_chart)
            )
          ],
          onTap: (int index)  {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
        ),
        body: screenMap[_currentIndex],
      );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}


