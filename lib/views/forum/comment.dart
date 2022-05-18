import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/views/forum/comment_add.dart';

class CommentView extends StatefulWidget {
  Forum forum;
  CommentView({Key? key, required this.forum}) : super(key: key);

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: color2,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          Get.to(() => CommentAddView(
                forum: widget.forum,
              ));
        },
        backgroundColor: color2,
      ),
    );
  }
}
