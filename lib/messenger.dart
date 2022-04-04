import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tpfinal/contact.dart';
import 'package:tpfinal/chat.dart';
import 'package:tpfinal/widget/profil.dart';
<<<<<<< HEAD

import 'contact.dart';
=======
>>>>>>> 1de857851ed85f9851dc0a9bf853a317c90f22c6

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
  int _selectedIndex = 0; //New
  late String Search;

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
<<<<<<< HEAD
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 98, 23, 189), size: 40),
        selectedItemColor: Color.fromARGB(255, 98, 23, 189),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
=======
        selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 98, 23, 189), size: 40),
        selectedItemColor: const Color.fromARGB(255, 98, 23, 189),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
>>>>>>> 1de857851ed85f9851dc0a9bf853a317c90f22c6
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            label: 'Ajouter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        flexibleSpace: Column(children: [
          //------------mail-----------------
          TextField(
            onChanged: (value) {
              setState(() {
                Search = value;
              });
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "rechercher un contact",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 98, 23, 189)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),

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
<<<<<<< HEAD
        ]),
      ),
    );
=======
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return profil();
              }));
            },
            child: const Text(
              "profil",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ]),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const messenger();
      }));
    });
>>>>>>> 1de857851ed85f9851dc0a9bf853a317c90f22c6
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  /*Widget bodyPage() {
    return Column(


    );
  }*/
}
