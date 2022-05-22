import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/comment.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/comment_service.dart';
import 'package:wikipets/service/user_service.dart';

class CommentView extends StatefulWidget {
  Forum forum;

  CommentView({Key? key, required this.forum}) : super(key: key);

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  final description = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  String name = "";

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
        title: Text("Comments"),
        backgroundColor: color2,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: 10,
              ),
              child: Container(
                padding:
                    EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: color1,
                  border: Border.all(
                    color: color3,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text(
                    widget.forum.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: color3,
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Consumer<CommentService>(
                  builder: (context, repositorio, child) {
                    return ListView.separated(
                      itemCount: repositorio.comments.length,
                      itemBuilder: (BuildContext contexto, int comment) {
                        final List<Comment> lista = repositorio.comments;
                        if (lista[comment].subject == widget.forum.subject) {
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Card(
                                    color: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: color3,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Container(
                                            child: Text(
                                              lista[comment].user,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: color3),
                                            ),
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                          ),
                                          subtitle: Text(
                                            lista[comment].description,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                      separatorBuilder: (_, __) => Container(),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    title: Container(
                      height: 55,
                      child: TextFormField(
                        controller: description,
                        decoration: InputDecoration(
                          hintText: "Comment",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              new Radius.circular(30.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Inform the comment";
                          }
                          return null;
                        },
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
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Comment comment = Comment(
                                "",
                                name,
                                description.text,
                                widget.forum.subject,
                                widget.forum.id);
                            Provider.of<CommentService>(context, listen: false)
                                .commentAdd(comment);
                            description.text = "";
                          }
                        },
                        icon: Icon(
                          Icons.send,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
