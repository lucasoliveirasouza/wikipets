import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wikipets/models/cat_model.dart';

class CatService extends ChangeNotifier {
  List<CatModel> _cats = [];

  UnmodifiableListView<CatModel> get cats => UnmodifiableListView(_cats);

  CatService() {
    _buscarCats();
  }

  _buscarCats() async {
    String uri = 'https://api.thecatapi.com/v1/breeds';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      List<dynamic> cats = json;

      cats.forEach((cat) {
        CatModel c = CatModel.fromJson(cat);
        _cats.add(c);
      });
      notifyListeners();
    }

    print(_cats.length);
  }
}
