import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/service/forum_service.dart';

class ForumAdd extends StatefulWidget {
  const ForumAdd({Key? key}) : super(key: key);

  @override
  _ForumAddState createState() => _ForumAddState();
}

class _ForumAddState extends State<ForumAdd> {
  final subject = TextEditingController();
  final description = TextEditingController();
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
                  Get.snackbar(
                    "Cadastro de forum",
                    ForumService()
                        .cadastrarForum(subject.text, description.text, 'TESTE')
                        .toString(),
                    backgroundColor: color1,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  Navigator.of(context).pop();
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
