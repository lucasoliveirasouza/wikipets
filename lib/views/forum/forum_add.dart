import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/forum_service.dart';
import 'package:wikipets/service/user_service.dart';

class ForumAdd extends StatefulWidget {
  const ForumAdd({Key? key}) : super(key: key);

  @override
  _ForumAddState createState() => _ForumAddState();
}

class _ForumAddState extends State<ForumAdd> {
  final subject = TextEditingController();
  final description = TextEditingController();
  String nome = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserService().getUser(auth.currentUser!.email.toString()).then((value) {
      setState(() {
        nome = value?.nome ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color2,
        title: Text("Register question"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: ListView(
          children: [
            TextFormField(
              controller: subject,
              decoration: InputDecoration(
                label: Text("Subject"),
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
                  Forum forum = Forum("", nome, subject.text, description.text);
                  Get.snackbar(
                    "Cadastro de forum",
                      Provider.of<ForumService>(context, listen: false).cadastrarForum(forum).toString(),
                    snackPosition: SnackPosition.TOP,
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
