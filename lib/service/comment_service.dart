import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wikipets/models/comment.dart';

class CommentService extends ChangeNotifier {
  List<Comment> _comments = [];

  UnmodifiableListView<Comment> get comments => UnmodifiableListView(_comments);

  CommentService() {
    _searchComment();
  }

  _searchComment() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('comment').get();

      snapshot.docs.forEach((d) {
        Comment comment = Comment(
            d.id, d["user"], d["description"], d["subject"], d["idForum"]);
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
          FirebaseFirestore.instance.collection('comment');
      comments.add({
        'description': comment.description,
        'subject': comment.subject,
        'user': comment.user,
        'idForum': comment.idForum,
      });
      _comments.add(comment);
      notifyListeners();
      return "Registered comment!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  String? editComment(Comment comment, String description) {
    try {
      var collection = FirebaseFirestore.instance.collection('comment');
      collection.doc(comment.id).update({
        'description': description,
        'subject': comment.subject,
        'user': comment.user,
        'idForum': comment.idForum,
      });

      _comments.forEach((element) {
        if (element.description == comment.description) {
          element.description = description;
          notifyListeners();
        }
      });

      return "Edited comment!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  String? removeComment(Comment comment) {
    try {
      var collection = FirebaseFirestore.instance.collection('comment');
      collection.doc(comment.id).delete();

      _comments.removeWhere((element) => element.id == comment.id);
      notifyListeners();
      return "Removed comment!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
