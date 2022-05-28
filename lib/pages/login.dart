import 'package:alerta_pmw/pages/cadastro.dart';
import 'package:alerta_pmw/pages/principal.dart';
import 'package:alerta_pmw/pages/recuperar_senha.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

void validar() {}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: 105,
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
                        const SizedBox(height: 21),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                              hintText: 'E-maill',
                              hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              suffixIcon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              )),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
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
                          obscureText: true,
                        ),
                        const SizedBox(height: 21),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            minimumSize: const Size.fromHeight(60),
                          ),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PrinciapalPage(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(60),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 28, 27, 27)),
                          ),
                          icon: Image.asset(
                            'assets/images/google.png',
                            height: 40,
                          ),
                          label: const Text(
                            'Entrar com o google',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RecuperarSenhaPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: const Text('Esqueceu a senha?'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui conta?'),
                            TextButton(
                              onPressed: () {
                                // Navegação entre telas.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CadastroPage(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: const Text('Registar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
