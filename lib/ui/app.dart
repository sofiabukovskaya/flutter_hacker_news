import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_provider.dart';
import 'package:flutter_news/ui/pages/news/widgets/news.dart';
import 'package:flutter_news/ui/pages/news_detail/news_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        onGenerateRoute: routes,
      ),
    );
  }
}

Route routes(RouteSettings routeSettings) {
  if (routeSettings.name == '/') {
    return MaterialPageRoute(
      builder: (context) {
        return News();
      },
    );
  } else {
    return MaterialPageRoute(builder: (context) {
      final itemId = int.parse(routeSettings.name.replaceFirst('/', ''));
      return NewsDetail(itemId: itemId);
    });
  }
}
