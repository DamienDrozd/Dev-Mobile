import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projetclass/model/utilisateur.dart';

// ignore: camel_case_types
class firestoreHelper {
  //Attributs
  final auth = FirebaseAuth.instance;
  final fire_user = FirebaseFirestore.instance.collection("Utilisateur");
  final fireStorage = FirebaseStorage.instance;

  //Constructor

  //--------------------Methods---------------------------
  //Register
  Future inscription(
      String nom, String prenom, String mail, String password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: mail, password: password);
    User? user = result.user;
    String uid = user!.uid;
    Map<String, dynamic> value = {
      "NOM": nom,
      "PRENOM": prenom,
      "MAIL": mail,
    };
    addUser(uid, value);
  }

  //Login
  Future login(String mail, String password) async {
    auth.signInWithEmailAndPassword(email: mail, password: password);
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
  }

  //Add User
  addUser(String uid, Map<String, dynamic> map) {
    fire_user.doc(uid).set(map);
  }

  //Update user
  updateUser(String uid, Map<String, dynamic> map) {
    fire_user.doc(uid).update(map);
  }

  Future<String> getId() async {
    String uid = auth.currentUser!.uid;
    return uid;
  }

  Future<utilisateur> getUser(String uid) async {
    DocumentSnapshot snapshot = await fire_user.doc(uid).get();
    return utilisateur(snapshot);
  }

  Future<String> addImg(String nameImg, Uint8List data) async {
    String? urlPath;
    TaskSnapshot snapshotTask =
        await fireStorage.ref("image/$nameImg").putData(data);
    urlPath = await snapshotTask.ref.getDownloadURL();
    return urlPath;
  }
}
