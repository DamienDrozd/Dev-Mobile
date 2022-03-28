// ignore: file_names, camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class utilisateur {
  //attributs
  late String uid;
  late String nom;
  late String prenom;
  DateTime? birthday;
  late String mail;
  String? telephone;
  String? avatar;

  //construction
  utilisateur(DocumentSnapshot snapshot) {
    uid = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    mail = map["MAIL"];
    Timestamp? timestamp = map["BIRTHDAY"];
    birthday = timestamp?.toDate();
    telephone = map["TELEPHONE"];
    avatar = map["AVATAR"];
  }

  //methods
}
