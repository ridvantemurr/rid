import 'package:flutter/material.dart';

class Kaydol extends StatefulWidget {
  const Kaydol({Key? key}) : super(key: key);

  @override
  State<Kaydol> createState() => _KaydolState();
}

class _KaydolState extends State<Kaydol> {
  bool isPasswordInvisible = true;
  final textEditingControllerEposta = TextEditingController();
  final textEditingControllerPassword = TextEditingController();
  bool isLoginDisenabled = true;
  String dropdownValue = 'A(+)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aranan Kan'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 50,
              right: 50,
            ),
            child: TextField(
              cursorColor: Colors.red,
              controller: textEditingControllerEposta,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                setState(() {
                  isLoginDisenabled =
                      textEditingControllerEposta.text.isEmpty ||
                          textEditingControllerPassword.text.isEmpty;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 10,
                    )),
                labelText: ('E postanız'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 50,
              right: 50,
            ),
            child: TextField(
              controller: textEditingControllerPassword,
              onChanged: (value) {
                setState(() {
                  isLoginDisenabled =
                      textEditingControllerEposta.text.isEmpty ||
                          textEditingControllerPassword.text.isEmpty;
                });
              },
              onSubmitted: (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Giris Basarili")));
              },
              obscureText: isPasswordInvisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 10,
                    )),
                labelText: ('Şifreniz'),
                suffixIcon: IconButton(
                    splashRadius: 1,
                    icon: isPasswordInvisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordInvisible = !isPasswordInvisible;
                      });
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 50,
              right: 50,
            ),
            child: TextField(
              controller: textEditingControllerPassword,
              onChanged: (value) {
                setState(() {
                  isLoginDisenabled =
                      textEditingControllerEposta.text.isEmpty ||
                          textEditingControllerPassword.text.isEmpty;
                });
              },
              onSubmitted: (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Giris Basarili")));
              },
              obscureText: isPasswordInvisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 10,
                    )),
                labelText: ('Şifreniz tekrar'),
                suffixIcon: IconButton(
                    splashRadius: 1,
                    icon: isPasswordInvisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordInvisible = !isPasswordInvisible;
                      });
                    }),
              ),
            ),
          ),
          Padding(
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(children: [
              Expanded(
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/anasayfa');
                    },
                    child: const Text(
                      ('Kaydol'),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
