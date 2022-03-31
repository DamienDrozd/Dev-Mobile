import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tpfinal/contact.dart';
import 'package:tpfinal/chat.dart';
import 'package:tpfinal/widget/profil.dart';
import 'package:tpfinal/model/usersfirebase.dart';

import 'contact.dart';

// ignore: camel_case_types
class messenger extends StatefulWidget {
  const messenger({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return messengerState();
  }
}

// ignore: camel_case_types
class messengerState extends State<messenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Messagerie"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: bodyPage(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget bodyPage() {
    return Column(children: [
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const contact();
          }));
        },
        child: const Text(
          "contact",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return profil();
          }));
        },
        child: const Text(
          "Profil",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ]);
  }
}
