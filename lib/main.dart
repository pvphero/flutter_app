import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '电影海报',
      home: Scaffold(
        appBar: AppBar(
          title: Text("电影"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.75,
          ),
          children: [
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'https://img4.sycdn.imooc.com/58577eaf00017b9c06000338-360-202.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}