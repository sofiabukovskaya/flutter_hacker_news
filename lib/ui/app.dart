import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_provider.dart';
import 'package:flutter_news/ui/pages/news.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
      title: 'News',
      home: News(),
     ),
    );
  }

}