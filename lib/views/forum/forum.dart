import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/forum_service.dart';
import 'package:wikipets/views/forum/comment.dart';
import 'package:wikipets/views/forum/forum_add.dart';

class ForumView extends StatefulWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  @override
  Widget build(BuildContext context) {
    Future<List<Forum?>?> futureList = ForumService().getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
        backgroundColor: color2,
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15, top: 10),
        child: FutureBuilder(
            future: futureList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Forum?>?> snapshot) {
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
                                Container(
                                  child: Center(
                                    child: Text(
                                      snapshot.data![index]!.user,
                                      style: TextStyle(
                                        color: color3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(top: 10, bottom: 5),
                                ),
                                Divider(
                                  color: color3,
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      snapshot.data![index]!.description,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 10, left: 15, right: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(() => CommentView(
                                forum: snapshot.data![index]!,
                              ));
                        },
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: color2,
        onPressed: () {
          Get.to(() => ForumAdd());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
