import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wikipets/componentes/grid_card.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/views/favorites/cats_favorites.dart';
import 'package:wikipets/views/favorites/dogs_favorites.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        backgroundColor: color2,
      ),
      body: Container(
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              CardItem(
                image: "cat.png",
                title: "Cats favorites",
                color: color1,
                onTap: () {
                  Get.to(() => CatsFavoritesView());
                },
              ),
              CardItem(
                image: "dog.png",
                title: "Dogs favorites",
                color: color1,
                onTap: () {
                  Get.to(() => DogsFavoritesView());
                },
              ),
            ]),
      ),
    );
  }
}
