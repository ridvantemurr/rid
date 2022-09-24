import 'package:aranan_kan/screens/anasayfa/aranan_kan_ol.dart';
import 'package:aranan_kan/screens/anasayfa/kan_akisi.dart';
import 'package:aranan_kan/screens/anasayfa/kan_bildirimleri.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<Widget> bottomNavigationBarScreen = [
    KanAkisi(),
    KanBildirimleri(),
    const ArananKanOl(),
    const Center(
      child: Text('Profilim'),
    ),
  ];
  int selectedBottomBarItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedBottomBarItem = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Kan Akışı',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Kan Bildirimleri',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype),
            label: 'Aranan Kan Ol',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Profilim',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: selectedBottomBarItem,
        unselectedItemColor: Colors.white54,
        fixedColor: Colors.white,
      ),
      appBar: AppBar(
        title: const Text('Aranan Kan'),
      ),
      backgroundColor: Colors.white,
      body: bottomNavigationBarScreen[selectedBottomBarItem],
    );
  }
}
