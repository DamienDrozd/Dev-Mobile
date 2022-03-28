import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetclass/dashbord.dart';
import 'package:projetclass/functions/firestoreHelper.dart';
import 'package:projetclass/register.dart';
// import 'package:firebase_auth/firebase_auth.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My First Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double maPosition = 0.0;
  late String mail;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: bodyPage(),
      )),
    );
  }

  popUp() {
    showDialog(
        context: context,
        builder: (context) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: const Text("Connection failed !"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          } else {
            return AlertDialog(
              title: const Text("Connection failed !"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          }
        });
  }

  Widget bodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Afficher notre logo
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                    "assets/Tomb-Raider-definitive-ed-012.jpg",
                  ),
                  fit: BoxFit.fill)),
        ),

        //Taper une adresse mail
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

        //Taper un mot de passe
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

        //Taper un bouton connexion
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              print("J'ai appuyé");
              firestoreHelper().login(mail, password).then((value) {
                print("Successfull login");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return dashboard();
                }));
              }).catchError((onError) {
                print("Connection failed");
                popUp();
              });
            },
            child: const Text("Connexion")),

        //Cliquer un lien inscription
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
