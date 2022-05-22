
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wikipets/database/db.dart';
import 'package:wikipets/models/cat_model.dart';

class CatFavoriteRepository extends ChangeNotifier{
  late Database db;

  List<CatModel> _cats = [];

  UnmodifiableListView<CatModel> get cats => UnmodifiableListView(_cats);

  CatFavoriteRepository() {
    _getAllCatFavorites();
  }

  _getAllCatFavorites() async {
    db = await DB.instace.database;
    var res = await db.query("catsFavorites");
    _cats = res.isNotEmpty ? res.map((c) => CatModel.fromMap(c)).toList() : [];
    notifyListeners();
    print(_cats.length);

  }

  newCatFavorite(CatModel cat) async{
    _cats.add(cat);
    notifyListeners();
    db = await DB.instace.database;
    try {

      db = await DB.instace.database;
      await db.insert(
        'catsFavorites',
        cat.toMap(),
      );
    } catch (ex) {
      print(ex);
      return;
    }

  }
}