import 'package:flutter_news/data/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {
  final _topIds = PublishSubject<List<int>>();
  final _repository = Repository();

  Observable<List<int>> get topIds => _topIds.stream;

  fetchTopIds()async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }
  dispose() {
    _topIds.close();
  }
}