import 'package:aranan_kan/models/bildirimler.dart';
import 'package:aranan_kan/sabit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KanAkisi extends StatefulWidget {
  const KanAkisi({Key? key}) : super(key: key);

  @override
  State<KanAkisi> createState() => _KanAkisiState();
}

class _KanAkisiState extends State<KanAkisi> {
  final textEditingControllerSaat = TextEditingController();
  String varisSuresi = "";
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Sabit().kanListesi.length,
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            child: Card(
              child: ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                      'Kan bildirimine cevap vereceğiniz süreyi seçin'),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: textEditingControllerSaat,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 100),
                                    ),
                                    onPressed: () {
                                      if (int.parse(
                                              textEditingControllerSaat.text) <
                                          60) {
                                        varisSuresi =
                                            "${textEditingControllerSaat.text} dakika";
                                      } else {
                                        int saat = (int.parse(
                                                    textEditingControllerSaat
                                                        .text) /
                                                60)
                                            .floor();
                                        varisSuresi =
                                            "$saat saat ${int.parse(textEditingControllerSaat.text) % 60} dakika";
                                      }
                                      Sabit().kanBildirimleri.add(
                                            Bildirimler(saat: varisSuresi),
                                          );
                                      textEditingControllerSaat.clear();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Paylaş'),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
                leading: Text(
                  DateFormat("Hm").format(Sabit().kanListesi[index].saat),
                ),
                title: Text(
                  Sabit().kanListesi[index].kanGrubu,
                ),
                subtitle: Text(
                  Sabit().kanListesi[index].hastane,
                ),
                trailing: Text(
                  Sabit().kanListesi[index].uzaklik,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
