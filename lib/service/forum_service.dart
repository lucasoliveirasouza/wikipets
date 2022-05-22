import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wikipets/models/forum.dart';

class ForumService extends ChangeNotifier {

  List<Forum> _foruns = [];

  UnmodifiableListView<Forum> get foruns => UnmodifiableListView(_foruns);

  ForumService() {
    _buscarForuns();
  }

  _buscarForuns() async{
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('forum')
          .orderBy("subject")
          .get();
      snapshot.docs.forEach((d) {
        Forum forum = Forum(d.id, d["user"], d["subject"], d["description"]);
        _foruns.add(forum);

      });
      notifyListeners();
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }


  String? cadastrarForum(Forum forum) {
    try {
      CollectionReference forumColecao =
          FirebaseFirestore.instance.collection('forum');
      forumColecao.add({
        'subject': forum.subject,
        'description': forum.description,
        'user': forum.user,
      });
      _foruns.add(forum);
      notifyListeners();
      return "Registered forum!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

}
