import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'stats.dart';

void main() => runApp(new MyApp());

Map<int, Widget> screenMap = <int, Widget> {
  0: new HomeScreen(),
  1: new StatsScreen(),
}; 


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cunts',
      home: new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              title: new Text('Home'),
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
      ),
      theme: new ThemeData(
        primaryColor: Colors.pink[500]
      ),
      
    );
  }
}



