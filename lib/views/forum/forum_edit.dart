import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/forum_service.dart';

class ForumEditView extends StatefulWidget {
  Forum forum;

  ForumEditView({Key? key, required this.forum}) : super(key: key);

  @override
  _ForumEditViewState createState() => _ForumEditViewState();
}

class _ForumEditViewState extends State<ForumEditView> {
  final description = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    description.text = widget.forum.description;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit comment"),
        backgroundColor: color2,
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20),
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
                      Get.snackbar(
                        "Forum registration",
                        Provider.of<ForumService>(context, listen: false)
                            .editForum(widget.forum, description.text)
                            .toString(),
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
              SizedBox(
                height: 25,
              ),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    size: 45,
                    color: color2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
