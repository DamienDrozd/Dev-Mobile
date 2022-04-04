// ignore: file_names
import 'dart:typed_data';

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

  //update an user profil
  updateUser(String uid, Map<String, dynamic> map) {
    fireUser.doc(uid).update(map);
  }

  //get the user ID
  Future<String> getID() async {
    String uid = auth.currentUser!.uid;
    return uid;
  }

  //get the user
  Future<UsersFirebase> getUser(String uid) async {
    DocumentSnapshot snapshot = await fireUser.doc(uid).get();
    return UsersFirebase(snapshot);
  }

  //function add Friend request
   sendFriendRequest(String userId, String friendId){

  }

  //function getFriendsRequests
  //Future<List> getFriendRequests(String userId){
   // UsersFirebase user = getUser(userId);

  //  return ;
  //}

  addFriend(String userId, String friendId){

  }

  //function getFriends
  //Future<List> getFriendRequests(String userId){
  // UsersFirebase user = getUser(userId);

  //  return ;
  //}
}
