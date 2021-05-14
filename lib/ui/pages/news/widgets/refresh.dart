import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_bloc.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;
  Refresh({this.child});
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
   return RefreshIndicator(child: child, onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
   );
  }
  
}