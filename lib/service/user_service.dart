import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wikipets/models/user.dart';

class UserService {
  String? createUser(User user) {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.add({
        'name': user.name,
        'email': user.email,
      });
      return "E-mail cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<User?> getUser(email) async {
    User? user;

    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      snapshot.docs.forEach((d) {
        if (email == d["email"]) {
          user = User(d["email"], "", d["name"]);
        }
      });
      return user;
    } on FirebaseException catch (e) {
      print(e.toString());
    }

    return user;
  }
}
