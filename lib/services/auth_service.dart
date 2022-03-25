import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_1/models/user_model.dart' as model;
import 'package:deneme_1/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  //get user detail
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String surname,
    required Uint8List file,
  }) async {
    String res = "Some error occurced";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          surname.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String photoUrl = await StorageService()
            .uploadImageToStorage('profilePics', file, false);
        model.User _user = model.User(
          name: name,
          surname: surname,
          password: password,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
        );
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password

        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
