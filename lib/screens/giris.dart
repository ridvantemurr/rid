import 'package:flutter/material.dart';

class Giris extends StatefulWidget {
  const Giris({Key? key}) : super(key: key);

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  bool isPasswordInvisible = true;
  final textEditingControllerEposta = TextEditingController();
  final textEditingControllerPassword = TextEditingController();
  bool isLoginDisenabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aranan Kan'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            'assets/aranankan.png',
            width: 150,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(
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
                Navigator.of(context).pushNamed('/anasayfa');
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
              right: 50,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('');
                },
                child: const Text('Şifrenizi mi unuttunuz?'),
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
                      ('Giriş Yap'),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              top: 16,
            ),
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/kaydol');
                },
                child: const Text('Şimdi Kaydol'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
