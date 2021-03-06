
import 'package:flutter_news/data/models/item_model.dart';
import 'package:flutter_news/data/repository/repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class NewsDbProvider implements Source, Cache {
  Database database;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'items.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
          newDb.execute('''
              CREATE TABLE Items
              (
                id INTEGER PRIMARY KEY,
                type TEXT,
                by TEXT,
                time INTEGER,
                text TEXT,
                parent INTEGER, 
                kids BLOB,
                dead  INTEGER,
                deleted INTEGER, 
                url TEXT,
                score INTEGER,
                title TEXT,
                descendants INTEGER
              )
            ''');
        });
  }

  @override
  // ignore: missing_return
  Future<List<int>> fetchTopIds() {

  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await database.query('Items',
        columns: null,
        where: 'id = ?',
        whereArgs: [id]);

    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel itemModel) async {
    return await database.insert('Items', itemModel.toMap(), conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  clear() {
    database.delete('Items');
  }
}
final newsDbProvider = NewsDbProvider();