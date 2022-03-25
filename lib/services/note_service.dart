import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_1/models/notes_model.dart';
import 'package:uuid/uuid.dart';

class NoteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadNote(
    String title,
    String description,
    String uid,
    String name,
    String surname,
  ) async {
    String res = "not yüklenirken hata oluştu";
    try {
      String noteId = const Uuid().v1();
      Note note = Note(
        name: name,
        surname: surname,
        uid: uid,
        noteId: noteId,
        title: title,
        description: description,
        datePublished: DateTime.now(),
      );
      _firestore.collection('notes').doc(noteId).set(note.toJson());
      res = 'succes';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
