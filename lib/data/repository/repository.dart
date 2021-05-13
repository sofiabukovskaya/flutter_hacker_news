
import 'package:flutter_news/data/api/news_api_provider.dart';
import 'package:flutter_news/data/db/news_db_provider.dart';
import 'package:flutter_news/data/models/item_model.dart';

class Repository {
 List<Source> sources = <Source> [
   newsDbProvider,
   NewsApiProvider()
 ];
 List<Cache> cashes = <Cache> [
   newsDbProvider
 ];
  Future<List<int>> fetchTopIds() {
      return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
      ItemModel itemModel;
      Source source;
      for(source in sources) {
        itemModel = await source.fetchItem(id);
        if (itemModel!=null) {
          break;
        }
      }
      
      for (var cache in cashes) {
        cache.addItem(itemModel);
      }
  }
}


abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache{
   Future<int> addItem(ItemModel itemModel);
}
