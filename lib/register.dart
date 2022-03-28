import 'package:flutter/material.dart';
import 'package:projetclass/functions/firestoreHelper.dart';

// ignore: camel_case_types
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return registerState();
  }
}

// ignore: camel_case_types
class registerState extends State<register> {
  late String mail;
  late String password;
  late String nom;
  late String prenom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inscription"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: bodyPage(),
        ));
  }

  Widget bodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              mail = value;
            });
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper une adresse mail",
              hintStyle: const TextStyle(color: Colors.red),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper un mot de passe",
              hintStyle: const TextStyle(color: Colors.red),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              nom = value;
            });
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper votre nom",
              hintStyle: const TextStyle(color: Colors.red),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              prenom = value;
            });
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper votre prénom",
              hintStyle: const TextStyle(color: Colors.red),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        ElevatedButton(
            onPressed: () {
              print("Je suis inscris");
              firestoreHelper().inscription(nom, prenom, mail, password);
            },
            child: const Text("Inscription"))
      ],
    );
  }
}
