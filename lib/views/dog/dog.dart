import 'package:flutter/material.dart';
import 'package:wikipets/componentes/row_table.dart';
import 'package:wikipets/models/dog_model.dart';
import 'package:flutter/src/widgets/image.dart' as img;

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
        backgroundColor: Colors.pink.shade100,
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
                  color: Colors.pink.shade100,
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
                  color: Colors.pink.shade100,
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                widget.dog.temperament.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pink, fontSize: 18),
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
