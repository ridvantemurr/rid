import 'package:aranan_kan/screens/anasayfa/anasayfa.dart';
import 'package:aranan_kan/screens/giris.dart';
import 'package:aranan_kan/screens/kaydol.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        initialRoute: '/giris',
        routes: {
          '/giris': (context) => const Giris(),
          '/anasayfa': (context) => const Anasayfa(),
          '/kaydol': (context) => const Kaydol(),
        },
      );
}
