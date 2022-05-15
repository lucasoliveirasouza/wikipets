class User{
  String _email;
  String _senha;

  User( this._email, this._senha);

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}