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
          body: Center(
            child: Container(
              height: 200.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  new Container(
                    width: 180.0,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 180.0,
                    color: Colors.pink,
                  ),
                  new Container(
                    width: 180.0,
                    color: Colors.yellow,
                  ),
                  new Container(
                    width: 180.0,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )),
    );
  }
}


