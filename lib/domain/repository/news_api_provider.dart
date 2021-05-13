import 'dart:convert';

import 'package:flutter_news/domain/models/item_model.dart';
import 'package:http/http.dart' show Client;

final String _root = 'hacker-news.firebaseio.com';

class NewsApiProvider {
  Client client = Client();

    Future<List<dynamic>> fetchTopIds() async {
    final response = await client.get(Uri.https(_root, '/v0/topstories.json'));
    final ids = jsonDecode(response.body);
    return ids;
  }

   Future<ItemModel> fetchItem(int id) async {
    final response = await client.get(Uri.https(_root, '/v0/item/$id.json'));
    final parsedJson = jsonDecode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
