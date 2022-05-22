import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/dog_model.dart';
import 'package:wikipets/service/dog_service.dart';
import 'package:wikipets/views/dog/dog.dart';
import 'package:flutter/src/widgets/image.dart' as img;

class DogsFavoritesView extends StatefulWidget {
  const DogsFavoritesView({Key? key}) : super(key: key);

  @override
  _DogsFavoritesViewState createState() => _DogsFavoritesViewState();
}

class _DogsFavoritesViewState extends State<DogsFavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dogs"),
        backgroundColor: color2,
      ),
      body: Consumer<DogService>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.dogs.length,
            itemBuilder: (BuildContext contexto, int dog) {
              final List<DogModel> lista = repositorio.dogs;
              if(lista[dog].starValue){
                return Container(
                  padding: EdgeInsets.only(),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => DogView(
                              dog: lista[dog],
                            ));
                          },
                          child: SizedBox(
                            child: img.Image.network(lista[dog].image?.url ??
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
                                  lista[dog].name ?? " ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<DogService>(context, listen: false).favoriteDog(lista[dog]);
                                  },
                                  child: Container(
                                    height: 25,
                                    child: img.Image.asset(lista[dog].star),
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
