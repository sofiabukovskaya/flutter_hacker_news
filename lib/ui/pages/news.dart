import 'package:flutter/material.dart';
import 'package:flutter_news/ui/pages/widgets/news_list.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
        ),
      body: newsList(),
    );
  }
}