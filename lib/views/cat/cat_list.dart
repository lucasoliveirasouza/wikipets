import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/cat_model.dart';
import 'package:flutter/src/widgets/image.dart' as img;
import 'package:wikipets/repositories/cat_favorite_repository.dart';
import 'package:wikipets/service/cat_service.dart';
import 'package:wikipets/views/cat/cat.dart';
import 'package:wikipets/views/favorites/cats_favorites.dart';

class CatListView extends StatefulWidget {
  const CatListView({Key? key}) : super(key: key);

  @override
  State<CatListView> createState() => _CatListViewState();
}

class _CatListViewState extends State<CatListView> {
  var star = "assets/images/starA.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cats"),
        backgroundColor: color2,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CatsFavoritesView());
            },
            icon: Icon(Icons.star),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Consumer<CatService>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.cats.length,
            itemBuilder: (BuildContext contexto, int cat) {
              final List<CatModel> lista = repositorio.cats;
              return Container(
                padding: EdgeInsets.only(),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CatView(
                                cat: lista[cat],
                              ));
                        },
                        child: SizedBox(
                          child: img.Image.network(lista[cat].image?.url ??
                              "https://www.petz.com.br/blog/wp-content/uploads/2020/08/cat-sitter-felino.jpg"),
                        ),
                      ),
                      Container(
                          height: 35,
                          color: color2,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                lista[cat].name ?? "",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<CatFavoriteRepository>(context,
                                          listen: false)
                                      .newCatFavorite(lista[cat]);
                                  Provider.of<CatService>(context,
                                          listen: false)
                                      .favoriteCat(lista[cat]);
                                },
                                child: Container(
                                  height: 25,
                                  child: img.Image.asset(lista[cat].star),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => Container(
              height: 5,
            ),
            padding: EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
