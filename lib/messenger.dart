import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tpfinal/contact.dart';
import 'package:tpfinal/chat.dart';
import 'package:tpfinal/widget/profil.dart';

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
  int _selectedIndex = 0; //New
  // ignore: non_constant_identifier_names
  late String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: bodyPage(), padding: const EdgeInsets.all(20)),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 98, 23, 189), size: 30),
        selectedItemColor: const Color.fromARGB(255, 98, 23, 189),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget bodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              search = value;
            });
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Nom du contact",
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 98, 23, 189)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
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
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const profil();
            }));
          },
          child: const Text(
            "profil",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
