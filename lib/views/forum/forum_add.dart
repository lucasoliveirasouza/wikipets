import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/forum_service.dart';
import 'package:wikipets/service/user_service.dart';

class ForumAddView extends StatefulWidget {
  const ForumAddView({Key? key}) : super(key: key);

  @override
  _ForumAddViewState createState() => _ForumAddViewState();
}

class _ForumAddViewState extends State<ForumAddView> {
  final subject = TextEditingController();
  final description = TextEditingController();
  String name = "";
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserService().getUser(auth.currentUser!.email.toString()).then((value) {
      setState(() {
        name = value?.name ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color2,
        title: Text("Question"),
      ),
      body: Form(
        key: formKey,
        child: Container(
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Inform the subject";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Inform the description";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Forum forum =
                      Forum("", name, subject.text, description.text);
                      Get.snackbar(
                        "Forum registration",
                        Provider.of<ForumService>(context, listen: false)
                            .cadastrarForum(forum)
                            .toString(),
                        backgroundColor: Colors.white,
                        snackPosition: SnackPosition.TOP,
                      );
                      Navigator.of(context).pop();
                    }

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
      ),
    );
  }

}
