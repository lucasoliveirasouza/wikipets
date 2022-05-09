import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/models/cat_model.dart';
import 'package:flutter/src/widgets/image.dart' as img;

import '../../service/cat_service.dart';

class CatListView extends StatefulWidget {
  const CatListView({Key? key}) : super(key: key);

  @override
  State<CatListView> createState() => _CatListViewState();
}

class _CatListViewState extends State<CatListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cats"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: Consumer<CatService>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.cats.length,
            itemBuilder: (BuildContext contexto, int cat) {
              final List<CatModel> lista = repositorio.cats;
              return ListTile(
                title: Text(lista[cat].name ?? ""),
                subtitle: Text(lista[cat].name ?? ""),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: img.Image.network(lista[cat].image?.url ??
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
