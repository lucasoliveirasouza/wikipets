import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:wikipets/models/comment.dart';

class CommentService {
  String? commentAdd(Comment comment) {
    try {
      CollectionReference comments =
          FirebaseFirestore.instance.collection('comments');
      comments.add({
        'descricao': comment.description,
        'usuario': comment.user,
        'idForum': comment.idForum,
      });
      return "Comentário cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<List<Comment?>?> getAll(id) async {
    List<Comment> comments = [];

    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('comments').get();

      snapshot.docs.forEach((d) {
        if (id == d["idForum"]) {
          Comment comment =
              Comment("", d["usuario"], d["descricao"], d["idForum"]);
          comments.add(comment);
        }
      });
      print(comments.length);
      return comments;
    } on FirebaseException catch (e) {
      print(e.toString());
    }

    return comments;
  }
}
