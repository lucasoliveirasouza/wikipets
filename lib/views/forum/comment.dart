import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/comment.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/comment_service.dart';

class CommentView extends StatefulWidget {
  Forum forum;
  CommentView({Key? key, required this.forum}) : super(key: key);

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  final description = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future<List<Comment?>?> futureList =
        CommentService().getAll(widget.forum.id);
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
                padding: EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: FutureBuilder(
                      future: futureList,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Comment?>?> snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    child: Card(
                                      color: color1,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: color3,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              snapshot.data![index]!.user,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: color3,
                                          ),
                                          ListTile(
                                            title: Text(
                                              snapshot
                                                  .data![index]!.description,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          }),
                        );
                      }),
                ),
              ),
            ),
            Container(
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
                      Comment comment = Comment(
                          "",
                          auth.currentUser!.email.toString(),
                          description.text,
                          widget.forum.id);
                      Get.snackbar(
                        "Cadastro de forum",
                        CommentService().commentAdd(comment).toString(),
                        backgroundColor: Colors.white,
                        snackPosition: SnackPosition.TOP,
                      );
                      description.text = "";
                    },
                    icon: Icon(
                      Icons.send,
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
