import 'package:wikipets/models/comment.dart';

class Forum {
  String _id;
  String _user;
  String _subject;
  String _description;
  List<Comment> _comments = [];

  Forum(this._id, this._user, this._subject, this._description);

  addComment(Comment comment) {
    _comments.add(comment);
  }

  List<Comment> comments() {
    return _comments;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get subject => _subject;

  set subject(String value) {
    _subject = value;
  }

  String get user => _user;

  set user(String value) {
    _user = value;
  }
}
