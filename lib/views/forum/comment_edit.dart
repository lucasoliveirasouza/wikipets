import 'package:flutter/material.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/comment.dart';

class CommentEditView extends StatefulWidget {
  Comment comment;
  CommentEditView({Key? key, required this.comment}) : super(key: key);

  @override
  State<CommentEditView> createState() => _CommentEditViewState();
}

class _CommentEditViewState extends State<CommentEditView> {
  final description = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    description.text = widget.comment.description;
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
                maxLines: 2,
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
                      /* Get.snackbar(
                        "Forum registration",
                        Provider.of<ForumService>(context, listen: false)
                            .editForum(widget.forum, description.text)
                            .toString(),
                      );*/
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
                height: 15,
              ),
              Center(
                child: IconButton(
                  onPressed: () {
                    /*Get.snackbar(
                      "Forum delete",
                      Provider.of<ForumService>(context, listen: false)
                          .removeForum(widget.forum)
                          .toString(),
                    );*/
                    Navigator.of(context).pop();
                  },
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
