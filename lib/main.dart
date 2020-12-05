import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/**
 * (=> 当行行数的简写
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('ListView'),
        ),
        body: new ListView(
          children: [
            new ListTile(
              leading: new Icon(Icons.ac_unit),
              title: new Text('data'),
            )
          ],
        ),
      ),
    );
  }
}


