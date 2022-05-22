import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/componentes/row_table.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/dog_model.dart';
import 'package:flutter/src/widgets/image.dart' as img;
import 'package:wikipets/service/dog_service.dart';

class DogView extends StatefulWidget {
  DogModel dog;
  DogView({Key? key, required this.dog}) : super(key: key);

  @override
  State<DogView> createState() => _DogViewState();
}

class _DogViewState extends State<DogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dog.name ?? ""),
        backgroundColor: color2,
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<DogService>(context, listen: false).favoriteDog(widget.dog);
            },
            child: Container(
              height: 30,
              child: img.Image.asset(
                  Provider.of<DogService>(context)
                      .dogs
                      .firstWhere((t) => t.id == widget.dog.id).star),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: color2,
                  style: BorderStyle.solid,
                  width: 5.0,
                ),
              ),
              child: SizedBox(
                child: img.Image.network(widget.dog.image?.url ??
                    "https://www.petz.com.br/blog/wp-content/uploads/2020/08/cat-sitter-felino.jpg"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: color2,
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
                color: color1,
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                widget.dog.temperament.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color3,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RowTable(
              valor: widget.dog.origin == null || widget.dog.origin == ""
                  ? "Unknown"
                  : widget.dog.origin.toString(),
              title: "Origin:",
            ),
            SizedBox(
              height: 3,
            ),
            RowTable(
              valor:
                  "${widget.dog.breedGroup == null || widget.dog.breedGroup == "" ? "Unknown" : widget.dog.breedGroup.toString()}",
              title: "Breed group:",
            ),
            SizedBox(
              height: 3,
            ),
            RowTable(
              valor: "${widget.dog.lifeSpan.toString()}",
              title: "Life span:",
            ),
            SizedBox(
              height: 3,
            ),
            RowTable(
              valor: "${widget.dog.weight?.metric.toString()} kilograms",
              title: "Weight:",
            ),
            SizedBox(
              height: 3,
            ),
            RowTable(
              valor: "${widget.dog.height?.metric.toString()} centimeters",
              title: "Height:",
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
