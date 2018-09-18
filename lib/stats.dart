import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Stats')),
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
                  var name = ds['name'] != null ? ds['name'] : '';
                  var isCunt = ds['isCunt'] != null ? ds['isCunt'] : '';
                  return new Text(" ${name} is cunt? ${isCunt}");
                }
            );
          }),
    );
  }
}