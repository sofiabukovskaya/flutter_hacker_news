import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/comments_bloc/comments_bloc.dart';

class CommentsProvider extends InheritedWidget {

  final CommentsBloc bloc;

  CommentsProvider({Key key, Widget child})
      : bloc = CommentsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CommentsBloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<CommentsProvider>()).bloc;
  }


}