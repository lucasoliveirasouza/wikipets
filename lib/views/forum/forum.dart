import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/forum_service.dart';
import 'package:wikipets/service/user_service.dart';
import 'package:wikipets/views/forum/comment.dart';
import 'package:wikipets/views/forum/forum_add.dart';
import 'package:wikipets/views/forum/forum_edit.dart';

class ForumView extends StatefulWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  String name = "";
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
                                child: Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        lista[forum].user,
                                        style: TextStyle(
                                          color: color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    verifica(lista[forum]),
                                  ],
                                ),
                                height: 40,
                                padding: EdgeInsets.only(
                                  left: 15,
                                  top: 5,
                                ),
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
                      height: 5,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => Container(),
            padding: EdgeInsets.all(16),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color3,
        onPressed: () {
          Get.to(() => ForumAddView());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget verifica(Forum forum){
    if(forum.user == name){
      return  IconButton(
        onPressed: () {
          Get.to(() => ForumEditView(forum: forum));
        },
        icon: Icon(
          Icons.edit,
          color: color3,
          size: 18,
        ),
      );
    }else{
      return Container();
    }
  }
}
