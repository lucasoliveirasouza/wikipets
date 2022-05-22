class User {
  String _email;
  String _password;
  String _name;

  User(this._email, this._password, this._name);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}
