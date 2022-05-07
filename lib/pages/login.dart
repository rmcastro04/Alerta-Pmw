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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.8),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
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
                    padding: const EdgeInsets.all(8.0),
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
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 60),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrinciapalPage(),
                          ),
                        );
                      },
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 60),
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
                  Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Expanded(
                            child: Text('Não possui conta?'),
                          ),
                        ),
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
