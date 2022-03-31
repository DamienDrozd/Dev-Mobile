// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tpfinal/functions/firebaseHelper.dart';
import 'package:tpfinal/register.dart';
import 'package:tpfinal/messenger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP - Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TP Flutter - Final'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String mail;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
            bodyPage() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget bodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                    "assets/img/logo/logo.png",
                  ),
                  fit: BoxFit.fill)),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text("E-mail"),
        //-------------------mail------------------------
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
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 98, 23, 189)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text("Mot de passe :"),
        //-------------------password------------------------
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
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 98, 23, 189)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        const SizedBox(
          height: 15,
        ),

        //-------------------Login--------------------------
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 98, 23, 189),
                textStyle: const TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              firebaseHelper().loginFirebase(mail, password).then((value) {
                log("Connexion réussi");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return messenger();
                }));
              }).catchError((onError) {
                log("Connexion échoué");
                // popUp();
              });
            },
            child: const Text("Connexion")),
        const SizedBox(
          height: 15,
        ),

        //-------------link Register--------------------
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const register();
            }));
          },
          child: const Text(
            "Inscription",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
