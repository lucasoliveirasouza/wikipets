import 'package:flutter/material.dart';
import 'package:wikipets/constantes.dart';

class RowTable extends StatelessWidget {
  String title;
  String valor;

  RowTable({
    Key? key,
    required this.valor,
    required this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Table(
        children: [
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(right: 5, top: 5, bottom: 5),
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: color3,
                  fontSize: 15,
                ),
              ),
              color: color1,
            ),
            Container(
              padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
              child: Text(
                valor,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  color: color3,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
