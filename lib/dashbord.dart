import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetclass/details.dart';
import 'package:projetclass/functions/firestoreHelper.dart';
import 'package:projetclass/model/utilisateur.dart';
import 'package:projetclass/myWidget/drawer.dart';

// ignore: camel_case_types
class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return dashboardState();
  }
}

// ignore: camel_case_types
class dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: AppBar(),
      body: bodyPage(),
    );
  }

  Widget bodyPage() {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreHelper().fire_user.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          List documents = snapshot.data!.docs;
          return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                utilisateur user = utilisateur(documents[index]);
                return Card(
                  color: Colors.green,
                  elevation: 5.0,
                  child: ListTile(
                    onTap: () {
                      //Navigation vers la page détail avec comme argument Utilisateur
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return details(user: user);
                      }));
                    },
                    title: Text("${user.nom} ${user.prenom}"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}
