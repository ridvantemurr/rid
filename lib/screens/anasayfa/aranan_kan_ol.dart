import 'dart:math';

import 'package:aranan_kan/sabit.dart';
import 'package:flutter/material.dart';

class ArananKanOl extends StatefulWidget {
  const ArananKanOl({Key? key}) : super(key: key);

  @override
  State<ArananKanOl> createState() => _ArananKanOlState();
}

class _ArananKanOlState extends State<ArananKanOl> {
  String dropdownValue = 'A(+)';
  String hospitalValue = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 50,
              right: 50,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 15, right: 15),
                child: DropdownButton<String>(
                  value: hospitalValue,
                  icon: const Icon(Icons.bloodtype),
                  iconEnabledColor: Colors.red,
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  onChanged: (String? newValue) {
                    setState(() {
                      hospitalValue = newValue!;
                    });
                  },
                  items: <String>[
                    '',
                    'Üsküdar Hospitaltürk Hastanesi',
                    'Özel Üsküdar Anadolu Hastanesi',
                    'Üsküdar Devlet Hastanesi',
                    'Özel Hurrem Sultan Hastanesi',
                    'Başkent Üniversitesi İstanbul Sağlık Uygulama ve Araştırma Hastanesi',
                    'SBÜ Zeynep Kamil Kadın ve Çocuk Hastalıkları Eğitim ve Araştırma Hastanesi',
                    'Academic Hospital',
                    'Erdem Hospital',
                    'Medicana Çamlıca Tıp Merkezi',
                    'Mihrimahsultan Tıp Merkezi',
                    'Özel Altunizade Polikliniliği',
                    'SBÜ Dr.Sami Ersek Göğüs Kalp ve Damar Cerrahisi Eğitim Araştırma Hastanesi'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  underline: Container(),
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 50,
              right: 50,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 15, right: 15),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.bloodtype),
                  iconEnabledColor: Colors.red,
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'A(+)',
                    'A(-)',
                    'B(+)',
                    'B(-)',
                    'AB(+)',
                    'AB(-)',
                    '0(+)',
                    '0(-)'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  underline: Container(),
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
          ),
          onPressed: hospitalValue != ''
              ? () {
                  var rng = Random();
                  Sabit().lokasyonAl(hospitalValue, dropdownValue,
                      "${rng.nextInt(10) + 1}km", DateTime.now());
                }
              : null,
          child: const Text('Paylaş'),
        ))
      ],
    );
  }
}
