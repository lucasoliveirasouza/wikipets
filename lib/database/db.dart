

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB{
  DB._();
  static final DB instace = DB._();

  static Database? _database;

  get database async{
    if(_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase()async{
    return await openDatabase(
      join(await getDatabasesPath(), "favorites.db"),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async{
    await db.execute(_catsFavorites);
    await db.execute(_dogsFavorites);
  }

  String get _catsFavorites => '''
    CREATE TABLE catsFavorites (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
    );
  ''';

  String get _dogsFavorites => '''
    CREATE TABLE dogsFavorites (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    );
  ''';
}