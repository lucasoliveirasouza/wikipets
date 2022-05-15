class Comment{
  String _user;
  String _description;

  Comment(this._user, this._description);

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get user => _user;

  set user(String value) {
    _user = value;
  }
}