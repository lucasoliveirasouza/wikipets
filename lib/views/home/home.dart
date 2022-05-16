import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wikipets/componentes/grid_card.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/service/auth_service.dart';
import 'package:wikipets/views/cat/cat_list.dart';
import 'package:wikipets/views/dog/dog_list.dart';
import 'package:wikipets/views/favorites/favorite.dart';
import 'package:wikipets/views/forum/forum.dart';

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
        backgroundColor: color2,
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "Logout?",
                  titleStyle: TextStyle(color: color3),
                  middleTextStyle: TextStyle(color: Colors.white),
                  onConfirm: () {
                    AuthService().logout();
                    Get.close(0);
                  },
                  textConfirm: "Confirm",
                  textCancel: "Cancel",
                  cancelTextColor: color3,
                  confirmTextColor: Colors.white,
                  buttonColor: color3,
                  radius: 5,
                  content: Column(
                    children: [],
                  ));
              //
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
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
                color: color1,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CatListView()));
                },
              ),
              CardItem(
                image: "dog.png",
                title: "Dogs",
                color: color1,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DogListView()));
                },
              ),
              CardItem(
                image: "star.png",
                title: "Favorites",
                color: color1,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoriteView()));
                },
              ),
              CardItem(
                image: "forum.png",
                title: "Forum",
                color: color1,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForumView()));
                },
              ),
            ]),
      ),
    );
  }
}
