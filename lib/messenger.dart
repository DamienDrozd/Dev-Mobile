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
  // ignore: non_constant_identifier_names
  int _selectedIndex = 0; //New
  // all pages
  final pages = [const messenger(), const contact(), const profil()];

  // changePage() allows to navigate on the other page
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return pages[index];
    }));
  }

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
        onTap: changePage,
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
      ],
    );
  }
}
