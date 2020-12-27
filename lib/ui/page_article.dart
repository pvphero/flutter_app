import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  //滑动控制器
  ScrollController _controller = new ScrollController();

  //控制器正在加载的显示
  bool _isLoading = true;

  //请求到文章的数据
  List articles = [];

  //banner
  List banners = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
