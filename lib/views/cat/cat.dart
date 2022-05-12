import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wikipets/componentes/rating_card.dart';
import 'package:wikipets/componentes/row_table.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/cat_model.dart';
import 'package:flutter/src/widgets/image.dart' as img;

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
          backgroundColor: color2,
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
                rating: double.parse(widget.cat.shortLegs.toString()),
                title: "Short legs ",
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
                rating: double.parse(widget.cat.suppressedTail.toString()),
                title: "Suppressed tail",
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
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: color2,
                style: BorderStyle.solid,
                width: 5.0,
              ),
            ),
            child: SizedBox(
              child: img.Image.network(widget.cat.image?.url ??
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
              widget.cat.description ?? "",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: color3,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RowTable(
            valor: widget.cat.origin.toString(),
            title: "Origin:",
          ),
          SizedBox(
            height: 3,
          ),
          RowTable(
            valor: "${widget.cat.lifeSpan.toString()} years",
            title: "Life span:",
          ),
          SizedBox(
            height: 3,
          ),
          RowTable(
            valor: "${widget.cat.weight?.metric.toString()} kilograms",
            title: "Weight:",
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "More information:",
              style: TextStyle(fontSize: 18, color: color3),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  openUrl(widget.cat.vcahospitalsUrl.toString());
                },
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: img.Image.asset("assets/images/VCA.png"),
                ),
              ),
              TextButton(
                onPressed: () {
                  openUrl(widget.cat.wikipediaUrl.toString());
                },
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: img.Image.asset("assets/images/wikipedia.png"),
                ),
              ),
              TextButton(
                onPressed: () {
                  openUrl(widget.cat.cfaUrl.toString());
                },
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: img.Image.asset("assets/images/cfa.png"),
                ),
              ),
              TextButton(
                onPressed: () {
                  openUrl(widget.cat.vetstreetUrl);
                },
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: img.Image.asset("assets/images/vetstreet.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  openBrowser(url) async {
    FlutterWebBrowser.openWebPage(url: url);
  }

  void openUrl(url) async {
    if (await canLaunch(url)) {
      await launch('$url');
      print("É possível abrir a URL");
    } else {
      print("Não è possível abrir a URL");
    }
  }
}
