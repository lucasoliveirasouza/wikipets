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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15),
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Comment",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          new Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: color3,
                      border: Border.all(
                        color: color3,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          Get.to(() => CommentAddView(
                forum: widget.forum,
              ));
        },
        backgroundColor: color2,
      ),*/
    );
  }
}
