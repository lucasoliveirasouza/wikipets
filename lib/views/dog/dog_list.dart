import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/models/dog_model.dart';
import 'package:wikipets/service/dog_service.dart';
import 'package:flutter/src/widgets/image.dart' as img;

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
        backgroundColor: Colors.pink.shade100,
      ),
      body: Consumer<DogService>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.dogs.length,
            itemBuilder: (BuildContext contexto, int dog) {
              final List<DogModel> lista = repositorio.dogs;
              return ListTile(
                title: Text(lista[dog].name ?? ""),
                subtitle: Text(lista[dog].name ?? ""),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: img.Image.network(lista[dog].image?.url ??
                      "https://www.petz.com.br/blog/wp-content/uploads/2020/08/cat-sitter-felino.jpg"),
                ),
                onTap: () {},
              );
            },
            separatorBuilder: (_, __) => Divider(),
            padding: EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
