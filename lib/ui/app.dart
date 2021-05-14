import 'package:flutter/material.dart';
import 'package:flutter_news/ui/pages/news.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      home: News(),
    );
  }

}