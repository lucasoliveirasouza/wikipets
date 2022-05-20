class User {
  String _email;
  String _senha;
  String _nome;

  User(this._email, this._senha, this._nome);

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}
