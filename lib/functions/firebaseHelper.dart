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
  final fireMessage = FirebaseFirestore.instance.collection("Message");
  final fireChat = FirebaseFirestore.instance.collection("Conversation");
  final fireStorage = FirebaseStorage.instance;

  //---------------------------Methods--------------------------------

  //--------function Register--------
  Future<UsersFirebase> registerFirebase(
      String lastname, String firstname, String mail, String password) async {
    UserCredential reg = await auth.createUserWithEmailAndPassword(
        email: mail, password: password);
    User user = reg.user!;
    String uid = user.uid;
    List<String> contact = [];
    Map<String, dynamic> values = {
      "NOM": lastname,
      "PRENOM": firstname,
      "MAIL": mail,
      "CONTACTS": contact,
    };
    //add a user to the database
    addUser(uid, values);
    return getUser(uid);
  }

  //--------function Login ---------
  Future<String> loginFirebase(String mail, String password) async {
    UserCredential logs =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
    return logs.user!.uid;
  }

  //--------function Logout ---------
  Future<void> logoutFirebase() async {
    await FirebaseAuth.instance.signOut();
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
    return auth.currentUser!.uid;
  }

  //get the user
  Future<UsersFirebase> getUser(String uid) async {
    DocumentSnapshot snapshot = await fireUser.doc(uid).get();
    return UsersFirebase(snapshot);
  }

  //Store Image into firestore database
  Future<String> storageImg(String uid, Uint8List datas) async {
    TaskSnapshot snapshot =
        await FirebaseStorage.instance.ref("images/$uid").putData(datas);
    return await snapshot.ref.getDownloadURL();
  }

  //---------------------------Methods--------------------------------

  //
/*
  //function send Friend request
  sendFriendRequest(String friendId) {
    Future<String> userId = getID();
    List frienrequest = getFriendRequests(userId);
  }
  */

  //function getFriendsRequests
  /*
  Future<List> getFriendRequests(String userId){
    Future<UsersFirebase> user = getUser(userId);

    return user.friendRequest;
  }

   */

  /*

  addFriend(String userId, String friendId) {
    Future<String> userId = getID();
    List frienlist1 = getFriends(userId);
    friendRequest1.add(friendId);
    List friendlist2 = getFriends(friendId);
    frienrequest2.add(userId);
    //update user && friend


  }

  */

/*
  Future<List> getFriend(String userId){
   UsersFirebase user = getUser(userId);


    return user.contacts;
  }

  */
}
