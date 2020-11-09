import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/**
 * (=> 当行行数的简写
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  //一个widgets的主要工作是提供一个build（）方法来描述如何根据其他较低级别的widgets来显示自己
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(primaryColor: Colors.white),
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      //   // This makes the visual density adapt to the platform that you run
      //   // the app on. For desktop platforms, the controls will be smaller and
      //   // closer together (more dense) than on mobile platforms.
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),

      //Scaffold 提供了导航栏  标题  主屏幕widget 树的 body 属性
      home: RandomWords(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: Text(widget.title)),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  //_buildSugggestions 用来构建显示建议单词的Listview
  Widget _buildSugggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        /**
         * 将单词添加到ListTitle行中。在偶数行，该函数会为单吃添加一个ListTitle row，在奇数行，该函数会添加一个分割线widget
         */
        itemBuilder: (context, i) {
          //在每一列添加一个像素是1分隔线 widget
          if (i.isOdd) {
            return Divider();
          }
          //表示i/2返回整形  向下取整，用来计算listview减去分割线后实际单词对应的数量
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            //如果是建议列表最后一个单词对，接着在生成10个单词对，然后添加到建议队列
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair=WordPair.random();
    // return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSugggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}
