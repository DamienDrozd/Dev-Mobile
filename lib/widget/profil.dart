// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tpfinal/functions/firebaseHelper.dart';
import 'package:tpfinal/model/usersfirebase.dart';

class profil extends StatefulWidget {
  profil({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return myprofil();
  }
}

class myprofil extends State<profil> {
  UsersFirebase myProfil = UsersFirebase.vide();
  Uint8List? byteFile;
  String? nameFile;
  String? urlFile;

  //-------------Methods-----------------
  getImg() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(withData: true, type: FileType.image);
    if (result != null) {
      nameFile = result.files.first.name;
      byteFile = result.files.first.bytes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Profil"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: bodyPage(),
      ),
    );
  }

  Widget bodyPage() {
    firebaseHelper().getID().then((String id) {
      setState(() {
        String userID = id;
        firebaseHelper().getUser(userID).then((UsersFirebase myuser) {
          setState(() {
            myProfil = myuser;
          });
        });
      });
    });

    return Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            InkWell(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: (myProfil.avatar == null)
                            ? const AssetImage("assets/img/icon/user.png")
                            : AssetImage(myProfil.avatar!))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("${myProfil.lastname} ${myProfil.firstname}")
          ],
        ));
  }
}
