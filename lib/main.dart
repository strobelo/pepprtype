import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cunts',
      home: const MyHomePage(title: 'Cunts'),
      theme: new ThemeData(
        primaryColor: Colors.pink[500]
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new StreamBuilder(
          stream: Firestore.instance.collection('test').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                padding: const EdgeInsets.only(top: 10.0),
                itemExtent: 25.0,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.documents[index];
                  return new Text(" ${ds['name']} is cunt? ${ds['isCunt']}");
                }
            );
          }),
    );
  }
}

// class LittleStatefulDude extends StatefulWidget {
//   @override
//   _LittleStatefulDudeState createState() => _LittleStatefulDudeState();
// }

// class _LittleStatefulDudeState extends State<LittleStatefulDude> {
//   bool 
// }