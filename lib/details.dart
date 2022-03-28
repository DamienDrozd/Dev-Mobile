import 'package:flutter/material.dart';
import 'package:projetclass/model/utilisateur.dart';

class details extends StatefulWidget {
  utilisateur user;
  details({required utilisateur this.user});
  @override
  State<StatefulWidget> createState() {
    return detailsState();
  }
}

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
