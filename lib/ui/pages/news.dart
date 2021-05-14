import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_provider.dart';
import 'file:///D:/Work%20InternShip/flutter_news/flutter_news/lib/ui/pages/news_list.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc  = StoriesProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
        ),
      body: newsList(bloc),
    );
  }
}