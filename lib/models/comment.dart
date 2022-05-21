class Comment {
  String _id;
  String _user;
  String _description;
  String _idForum;
  String _subject;

  Comment(this._id, this._user, this._description, this._subject, this._idForum);


  String get subject => _subject;

  set subject(String value) {
    _subject = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get user => _user;

  set user(String value) {
    _user = value;
  }

  String get idForum => _idForum;

  set idForum(String value) {
    _idForum = value;
  }
}
