import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_provider.dart';
import 'package:flutter_news/ui/pages/news/news_list.dart';

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