import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String title;
  final String description;
  final String noteId;
  final String uid;
  final String name;
  final String surname;
  final DateTime datePublished;

  const Note({
    required this.title,
    required this.description,
    required this.noteId,
    required this.uid,
    required this.name,
    required this.surname,
    required this.datePublished,
  });

  static Note fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Note(
      datePublished: snapshot["datePublished"],
      description: snapshot["description"],
      name: snapshot["name"],
      noteId: snapshot["noteId"],
      surname: snapshot["surname"],
      title: snapshot["title"],
      uid: snapshot["uid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "datePublished": datePublished,
        "description": description,
        "name": name,
        "noteId": noteId,
        "surname": surname,
        "title": title,
        "uid": uid
      };
}
