import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:projetclass/functions/firestoreHelper.dart';
import 'package:projetclass/model/utilisateur.dart';

// ignore: camel_case_types
class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return drawerState();
  }
}

// ignore: camel_case_types
class drawerState extends State<drawer> {
  @override
  // ignore: override_on_non_overriding_member
  late utilisateur myProfil;
  Uint8List? byteFile;
  String? nameFile;
  String? urlFile;

  //function
  //Recurperer une image dans la galerie du telephone
  getImg() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image,
    );
    if (result != null) {
      nameFile = result.files.first.name;
      byteFile = result.files.first.bytes;
      popUpImg();
    }
  }

  //afficher l'image choisie
  popUpImg() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Voulez-vous enregistrer cette image ?"),
            content: Image.memory(byteFile!),
            actions: [
              ElevatedButton(
                onPressed: () {
                  //annuler
                  Navigator.pop(context);
                },
                child: const Text("Annuler"),
              ),
              ElevatedButton(
                onPressed: () {
                  //enregistrer dans notre BDD
                  firestoreHelper()
                      .addImg(nameFile!, byteFile!)
                      .then((String urlImg) {
                    setState(() {
                      urlFile = urlImg;
                      Map<String, dynamic> map = {
                        "AVATAR": urlFile,
                      };
                      firestoreHelper().updateUser(myProfil.uid, map);
                      Navigator.pop(context);
                    });
                  });
                },
                child: const Text("Valider"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    firestoreHelper().getId().then((String id) {
      setState(() {
        String myid = id;
        firestoreHelper().getUser(myid).then((utilisateur myUser) {
          setState(() {});
          myProfil = myUser;
        });
      });
    });

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(children: [
        const SizedBox(
          height: 100,
        ),
        InkWell(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: (myProfil.avatar == null)
                      ? const NetworkImage(
                          "https://www.ouestfrance-auto.com/sites/default/files/voiture-miami.jpg")
                      : NetworkImage(myProfil.avatar!),
                )),
          ),
          onTap: () {
            // ignore: avoid_print
            print("récuperer image");
            getImg();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text("${myProfil.prenom} ${myProfil.nom}"),
      ]),
    );
  }
}
