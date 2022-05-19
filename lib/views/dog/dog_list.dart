import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/dog_model.dart';
import 'package:wikipets/service/dog_service.dart';
import 'package:flutter/src/widgets/image.dart' as img;
import 'package:wikipets/views/dog/dog.dart';

class DogListView extends StatefulWidget {
  const DogListView({Key? key}) : super(key: key);

  @override
  State<DogListView> createState() => _DogListViewState();
}

class _DogListViewState extends State<DogListView> {
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
                                lista[dog].name ?? "",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (!lista[dog].starValue) {
                                      lista[dog].star =
                                          "assets/images/starA.png";
                                      lista[dog].starValue = true;
                                    } else if (lista[dog].starValue) {
                                      lista[dog].star =
                                          "assets/images/starB.png";
                                      lista[dog].starValue = false;
                                    }
                                  });
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
