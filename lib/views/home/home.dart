import 'package:flutter/material.dart';
import 'package:wikipets/componentes/grid_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: Container(
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              CardItem(
                image: "cat.png",
                title: "Cats",
                color: Colors.pink.shade50,
                onTap: () {},
              ),
              CardItem(
                image: "dog.png",
                title: "Dogs",
                color: Colors.pink.shade50,
                onTap: () {},
              ),
            ]),
      ),
    );
  }
}
