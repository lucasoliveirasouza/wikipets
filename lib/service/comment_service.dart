import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wikipets/models/comment.dart';

class CommentService extends ChangeNotifier{
  List<Comment> _comments = [];

  UnmodifiableListView<Comment> get comments => UnmodifiableListView(_comments);

  CommentService() {
    _searchComment();
  }

  _searchComment() async{
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('comments').get();

      snapshot.docs.forEach((d) {
          Comment comment =
          Comment("", d["usuario"], d["descricao"],d["assunto"], d["idForum"]);
          _comments.add(comment);

      });
      notifyListeners();
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  String? commentAdd(Comment comment) {
    try {
      CollectionReference comments =
          FirebaseFirestore.instance.collection('comments');
      comments.add({
        'descricao': comment.description,
        'assunto': comment.subject,
        'usuario': comment.user,
        'idForum': comment.idForum,
      });
      _comments.add(comment);
      notifyListeners();
      return "Comentário cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

}
