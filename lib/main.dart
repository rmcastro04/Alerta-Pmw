import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: LoginPage()));
  }
}

void validar() {}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 115,
            ),
            const Text(
              "AlertaPMW",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'BankGothic md BT Medium',
                fontSize: 45,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
              child: TextField(
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                decoration: InputDecoration(
                    fillColor: Colors.black45.withOpacity(0.3),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'E-mail',
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    suffixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 15),
              child: TextField(
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                decoration: InputDecoration(
                    fillColor: Colors.black45.withOpacity(0.3),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Senha',
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    suffixIcon: const Icon(
                      Icons.key,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 15),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: Size(MediaQuery.of(context).size.width, 60),
                ),
                onPressed: () {},
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'ENTRAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 15),
              child: TextButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.black,
                        ))),
                onPressed: () {},
                child: const Text(
                  'Entrar com o google',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Text(
              'Esquece a senha ?',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),

            const Text('Não tem uma conta ? Registrar')
          ],
        ));
  }
}
