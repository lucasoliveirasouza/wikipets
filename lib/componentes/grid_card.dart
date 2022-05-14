import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  String image, title;
  Color color;
  VoidCallback? onTap;

  CardItem({
    Key? key,
    required this.image,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: EdgeInsets.all(8),
        child: Column(children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/images/" + image),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
