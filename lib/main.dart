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
            new Image.network(
                'https://img4.sycdn.imooc.com/5c18cf540001ac8206000338-360-202.jpg'),
            new Image.network(
                'https://img4.sycdn.imooc.com/5c18cf540001ac8206000338-360-202.jpg'),
            new Image.network(
                'https://img4.sycdn.imooc.com/5c18cf540001ac8206000338-360-202.jpg'),
            new Image.network(
                'https://img4.sycdn.imooc.com/5c18cf540001ac8206000338-360-202.jpg')
          ],
        ),
      ),
    );
  }
}


