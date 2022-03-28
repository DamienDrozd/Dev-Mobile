// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// ignore: unused_import
import 'package:tpfinal/model/usersfirebase.dart';

// ignore: camel_case_types
class firebaseHelper {
  //attributs
  final auth = FirebaseAuth.instance;
  final fireUser = FirebaseFirestore.instance.collection("Utilisateur");
  final fireStorage = FirebaseStorage.instance;

  //---------------------------Methods--------------------------------

  //--------function Register--------
  Future registerFirebase(
      String lastname, String firstname, String mail, String password) async {
    UserCredential reg = await auth.createUserWithEmailAndPassword(
        email: mail, password: password);
    User? user = reg.user;
    String uid = user!.uid;
    Map<String, dynamic> values = {
      "NOM": lastname,
      "PRENOM": firstname,
      "MAIL": mail,
    };
    //add a user to the database
    addUser(uid, values);
  }

  //--------function Login ---------
  Future<String> loginFirebase(String mail, String password) async {
    UserCredential logs =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
    return logs.user!.uid;
  }

  //add an user into the database
  addUser(String uid, Map<String, dynamic> map) {
    fireUser.doc(uid).set(map);
  }
}
