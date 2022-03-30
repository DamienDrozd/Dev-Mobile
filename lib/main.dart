// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tpfinal/functions/firebaseHelper.dart';

void main() {
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
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        const SizedBox(
          height: 15,
        ),
        const Text("Mot de passe :"),
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
        const SizedBox(
          height: 15,
        ),

        //Taper un bouton connexion
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              firebaseHelper().loginFirebase(mail, password).then((value) {
                print("Connexion réussi");
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return dashboard();
                // }));
              }).catchError((onError) {
                print("Connexion échoué");
                // popUp();
              });
            },
            child: const Text("Connexion")),
        const SizedBox(
          height: 15,
        ),

        //Cliquer un lien inscription
        InkWell(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (BuildContext context) {
            //   // return registerFirebase();
            // }));
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
