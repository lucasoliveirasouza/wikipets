import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/forum.dart';
import 'package:wikipets/service/forum_service.dart';
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
                      Container(
                        child: Card(
                          color: color1,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: color3,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3),
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
                                leading: Icon(
                                  Icons.account_circle,
                                  size: 50,
                                  color: color3,
                                ),
                                onTap: () {},
                              ),
                              Divider(
                                color: color3,
                              ),
                              ListTile(
                                title: Text(
                                  snapshot.data![index]!.description,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
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
