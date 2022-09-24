import 'package:flutter/material.dart';
import '../../sabit.dart';

class KanBildirimleri extends StatefulWidget {
  const KanBildirimleri({Key? key}) : super(key: key);

  @override
  State<KanBildirimleri> createState() => _KanBildirimleriState();
}

class _KanBildirimleriState extends State<KanBildirimleri> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Sabit().kanBildirimleri.length,
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            child: Card(
              child: ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    'assets/aranankanlogo.png',
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    Sabit().kanBildirimleri[index].mesaj,
                  ),
                  subtitle: Text(
                    "Varış Süresi: ${Sabit().kanBildirimleri[index].saat}",
                  ),
                  trailing: const Icon(
                    Icons.warning,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
