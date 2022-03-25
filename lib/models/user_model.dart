import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String password;
  final String uid;
  final String photoUrl;
  final String name;
  final String surname;

  const User(
      {required this.name,
      required this.surname,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.password});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      name: snapshot["name"],
      surname: snapshot["surname"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      password: snapshot["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "password": password,
      };
}
