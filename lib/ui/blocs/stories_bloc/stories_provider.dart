import 'package:flutter/material.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Key key, Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static StoriesBloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<StoriesProvider>()).bloc;
  }
}
