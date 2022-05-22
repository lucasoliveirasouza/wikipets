import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/image.dart' as img;
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/cat_model.dart';
import 'package:wikipets/service/cat_service.dart';
import 'package:wikipets/views/cat/cat.dart';

class CatsFavoritesView extends StatefulWidget {
  const CatsFavoritesView({Key? key}) : super(key: key);

  @override
  _CatsFavoritesViewState createState() => _CatsFavoritesViewState();
}

class _CatsFavoritesViewState extends State<CatsFavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cats favorites"),
        backgroundColor: color2,
      ),
      body: Consumer<CatService>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.cats.length,
            itemBuilder: (BuildContext contexto, int cat) {
              final List<CatModel> lista = repositorio.cats;
              if(lista[cat].starValue){
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
                                    // Provider.of<CatFavoriteRepository>(context, listen: false).newCatFavorite(lista[cat]);
                                    Provider.of<CatService>(context, listen: false).favoriteCat(lista[cat]);

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
              }else{
                return Container();
              }
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
