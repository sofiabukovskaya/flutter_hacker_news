import 'dart:convert';

import 'file:///D:/Work%20InternShip/flutter_news/flutter_news/lib/data/api/news_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
      final newsApi = NewsApiProvider();

     newsApi.client = MockClient((request) async {
        return Response(jsonEncode([1,2,3,4]), 200);
      });

     final ids = await newsApi.fetchTopIds();

     expect(ids, [1,2,3,4]);
  });

  test('FetchItem returns a item model', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id' : 123};
      return Response(jsonEncode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(999);
    expect(item.id, 123);
  });
}