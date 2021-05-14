import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_bloc.dart';

Widget newsList(StoriesBloc bloc) {
  return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              return Text('${snapshot.data[index]}');
            });
      });
}
