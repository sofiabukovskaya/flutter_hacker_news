import 'dart:async';
import 'dart:async';

import 'package:flutter_news/data/models/item_model.dart';
import 'package:flutter_news/data/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {

  final _repository = Repository();
  // final _topIds = PublishSubject<List<int>>();
  final _items = BehaviorSubject<int>();
  final _topIds =  StreamController<List<int>>();

  Observable<Map<int, Future<ItemModel>>> items;

  Stream<List<int>> get topIds => _topIds.stream; //Observable был

  Function(int) get fetchItem => _items.sink.add;

  fetchTopIds()async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransformer() {
        return ScanStreamTransformer(
            (Map<int, Future<ItemModel>> cache, int id,  _) {
                cache[id] = _repository.fetchItem(id);
                return cache;
            },
         <int, Future<ItemModel>> {},
        );
  }
  
  StoriesBloc() {
    _items.stream.transform(_itemsTransformer());
  }
  dispose() {
    _topIds.close();
    _items.close();
  }
}