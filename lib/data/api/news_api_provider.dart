import 'dart:convert';


import 'package:flutter_news/data/models/item_model.dart';
import 'package:flutter_news/data/repository/repository.dart';
import 'package:http/http.dart' show Client;

final String _root = 'hacker-news.firebaseio.com';

class NewsApiProvider implements Source{
  Client client = Client();

    Future<List<int>> fetchTopIds() async {
    final response = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'));
    print(response);
    final ids = jsonDecode(response.body);
    return ids.cast<int>();
  }

   Future<ItemModel> fetchItem(int id) async {
    final response = await client.get(Uri.https(_root, '/v0/item/$id.json'));
    print(response);
    final parsedJson = jsonDecode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
