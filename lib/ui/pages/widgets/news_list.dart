import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_bloc.dart';
import 'package:flutter_news/ui/pages/widgets/news_list_tile.dart';

Widget newsList(StoriesBloc bloc) {
  return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                bloc.fetchItem(snapshot.data[index]);
                return NewsListTile(
                  itemId: snapshot.data[index],
                );
              });
      });
}
