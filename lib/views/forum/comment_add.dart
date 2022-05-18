import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/comment.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/comment_service.dart';

class CommentAddView extends StatefulWidget {
  Forum forum;
  CommentAddView({Key? key, required this.forum}) : super(key: key);

  @override
  State<CommentAddView> createState() => _CommentAddViewState();
}

class _CommentAddViewState extends State<CommentAddView> {
  final description = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color2,
        title: Text("Comment"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            TextFormField(
              controller: description,
              maxLines: 4,
              decoration: InputDecoration(
                label: Text("Description"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    new Radius.circular(10.0),
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Comment comment = Comment(
                      "",
                      auth.currentUser!.email.toString(),
                      description.text,
                      widget.forum.id);
                  Get.snackbar(
                    "Cadastro de forum",
                    CommentService().commentAdd(comment).toString(),
                    backgroundColor: color1,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
