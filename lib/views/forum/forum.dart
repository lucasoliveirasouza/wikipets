import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
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
      body: Consumer<ForumService>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.foruns.length,
            itemBuilder: (BuildContext contexto, int forum) {
              final List<Forum> lista = repositorio.foruns;
              return Container(
                padding: EdgeInsets.only(),
                child: Column(
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
                                    lista[forum].user,
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
                                    lista[forum].description,
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
                          forum: lista[forum],
                        ));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => Container(
              height: 5,
            ),
            padding: EdgeInsets.all(16),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color3,
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
