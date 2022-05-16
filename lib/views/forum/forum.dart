import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/views/forum/forum_add.dart';

class ForumView extends StatefulWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
        backgroundColor: color2,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color2,
        onPressed: () {
          Get.to(() => ForumAdd());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
