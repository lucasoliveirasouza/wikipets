import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wikipets/models/cat_model.dart';

class CatView extends StatefulWidget {
  CatModel cat;
  CatView({Key? key, required this.cat}) : super(key: key);

  @override
  State<CatView> createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.cat.name ?? ""),
          backgroundColor: Colors.pink.shade100,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Overview",
              ),
              Tab(
                text: "Characteristics",
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            overview(),
            characteristics(),
          ],
        ),

        /*,*/
      ),
    );
  }

  Widget characteristics() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.pink.shade100,
                child: Card(
                  child: Container(
                    color: Colors.pink.shade50,
                    child: Column(
                      children: [
                        SizedBox(
                          child: RatingBarIndicator(
                            rating: double.parse(
                                widget.cat.adaptability.toString()),
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
                            "Adaptability",
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
              ),
              Container(
                width: 20,
              ),
              Container(
                color: Colors.pink.shade100,
                child: Card(
                  child: Container(
                    color: Colors.pink.shade50,
                    child: Column(
                      children: [
                        SizedBox(
                          child: RatingBarIndicator(
                            rating:
                                double.parse(widget.cat.dogFriendly.toString()),
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
                            "Dog Friendly",
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
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget overview() {
    return Container();
  }
}
