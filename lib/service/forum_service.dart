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
          .orderBy("assunto")
          .get();
      snapshot.docs.forEach((d) {
        Forum forum = Forum(d.id, d["usuario"], d["assunto"], d["descricao"]);
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
        'assunto': forum.subject,
        'descricao': forum.description,
        'usuario': forum.user,
      });
      _foruns.add(forum);
      notifyListeners();
      return "Fórum cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<List<Forum?>?> getAll() async {
    List<Forum> foruns = [];
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('forum')
          .orderBy("assunto")
          .get();
      snapshot.docs.forEach((d) {
        Forum forum = Forum(d.id, d["usuario"], d["assunto"], d["descricao"]);
        foruns.add(forum);
      });
      return foruns;
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return foruns;
  }
}
