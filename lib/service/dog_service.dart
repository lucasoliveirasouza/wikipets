import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wikipets/models/dog_model.dart';

class DogService extends ChangeNotifier {
  List<DogModel> _dogs = [];

  UnmodifiableListView<DogModel> get dogs => UnmodifiableListView(_dogs);

  DogService() {
    _buscarDogs();
  }

  _buscarDogs() async {
    String uri = 'https://api.thedogapi.com/v1/breeds';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      List<dynamic> dogs = json;

      dogs.forEach((dog) {
        DogModel c = DogModel.fromJson(dog);
        _dogs.add(c);
      });
      notifyListeners();
    }

    print(_dogs.length);
  }
}
