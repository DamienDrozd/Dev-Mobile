// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tpfinal/model/usersfirebase.dart';
import 'package:tpfinal/functions/firebaseHelper.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return contactState();
  }
}

class contactState extends State<contact> {
  @override
  late String Search;
  late List UserFirstName;
  late List UserLastName;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact"),
        ),
        body:
        bodyPage() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /*
  printList(documents){

  }

   */

  Widget bodyPage() {
    return Container(
      child:  Column(
        children:
        [
          TextField(
            onChanged: (value) {
              setState(() {
                Search = value;
                StreamBuilder<QuerySnapshot>(
                    //stream: firebaseHelper().fireUser.where(Search == user.firstname).snapshots(),
                    stream: firebaseHelper().fireUser.snapshots(),
                    builder: (context,snapshot) {
                      List documents = snapshot.data!.docs;
                      print(documents.length);
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            UsersFirebase user = UsersFirebase(documents[index]);


                          return Center(
                              child: Card(
                                  child: Column( mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const ListTile(
                                        title: Text("${user.firstname}  ${user.lastname}")
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          TextButton(
                                            child: const Text('ADD FRIEND'),
                                            onPressed: () {/* ... */},
                                          ),
                                          const SizedBox(width: 8),

                                        ],
                                      ),
                                    ]
                                )
                              )
                          );
                          }
                      );
                    }
                );

              });
            },
          ),

          //---------demandes d'ami reçues-------------------
          Text("demandes d'ami reçues"),
          StreamBuilder<QuerySnapshot>(
              //stream: firebaseHelper().fireUser.where(Search == user.firstname).snapshots(),
              stream: firebaseHelper().fireUser.snapshots(),
              builder: (context,snapshot) {
                  List documents = snapshot.data!.docs;
                  print(documents.length);
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                          UsersFirebase user = UsersFirebase(documents[index]);
                          return Center(
                              child: Card(
                                  child: Column( mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                      const ListTile(
                                          title: Text("${user.firstname}  ${user.lastname}")
                                      ),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                              TextButton(
                                                  child: const Text('ACCEPTER LA DEMANDE'),
                                                  onPressed: () {/* ... */},
                                              ),
                                              const SizedBox(width: 8),

                                          ],
                                          ),
                                      ]
                                  )
                              )
                          );
                      }
                  );
              }
          ),





        ]
      )
    );
  }
}

      /*
        return Column(
        children:
        [
        TextField(
        onChanged: (value) {
        setState(() {
        Search = value;

        });
        },
        ),
        ]
        );

     */



