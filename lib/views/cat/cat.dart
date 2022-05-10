import 'package:flutter/material.dart';
import 'package:wikipets/componentes/rating_card.dart';
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
              RatingItem(
                rating: double.parse(widget.cat.adaptability.toString()),
                title: "Adaptability",
              ),
              Container(
                width: 20,
              ),
              RatingItem(
                rating: double.parse(widget.cat.affectionLevel.toString()),
                title: "Affection",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingItem(
                rating: double.parse(widget.cat.childFriendly.toString()),
                title: "Child Friendly",
              ),
              Container(
                width: 20,
              ),
              RatingItem(
                rating: double.parse(widget.cat.dogFriendly.toString()),
                title: "Dog Friendly",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingItem(
                rating: double.parse(widget.cat.energyLevel.toString()),
                title: "Energy Level",
              ),
              Container(
                width: 20,
              ),
              RatingItem(
                rating: double.parse(widget.cat.grooming.toString()),
                title: "Grooming",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingItem(
                rating: double.parse(widget.cat.healthIssues.toString()),
                title: "Health Issues",
              ),
              Container(
                width: 20,
              ),
              RatingItem(
                rating: double.parse(widget.cat.intelligence.toString()),
                title: "Intelligence ",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingItem(
                rating: double.parse(widget.cat.sheddingLevel.toString()),
                title: "Shedding Level",
              ),
              Container(
                width: 20,
              ),
              RatingItem(
                rating: double.parse(widget.cat.socialNeeds.toString()),
                title: "Social Needs ",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingItem(
                rating: double.parse(widget.cat.strangerFriendly.toString()),
                title: "Stranger Friendly",
              ),
              Container(
                width: 20,
              ),
              RatingItem(
                rating: double.parse(widget.cat.vocalisation.toString()),
                title: "Vocalisation",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget overview() {
    return Container();
  }
}
