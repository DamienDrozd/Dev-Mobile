import 'package:flutter/material.dart';
import 'package:projetclass/model/utilisateur.dart';

// ignore: camel_case_types, must_be_immutable
class details extends StatefulWidget {
  utilisateur user;
  // ignore: type_init_formals
  details({Key? key, required utilisateur this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return detailsState();
  }
}

// ignore: camel_case_types
class detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.user.prenom} ${widget.user.nom}"),
      ),
      body: bodyPage(),
    );
  }
}

Widget bodyPage() {
  return const Text("Details du profil");
}
