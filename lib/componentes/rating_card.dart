import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingItem extends StatelessWidget {
  String title;
  double rating;

  RatingItem({
    Key? key,
    required this.rating,
    required this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.shade100,
      child: Card(
        child: Container(
          color: Colors.pink.shade50,
          child: Column(
            children: [
              SizedBox(
                child: RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30,
                  direction: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 35,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
