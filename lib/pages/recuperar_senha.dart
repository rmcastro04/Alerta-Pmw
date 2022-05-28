import 'package:flutter/material.dart';

class RecuperarSenhaPage extends StatefulWidget {
  const RecuperarSenhaPage({Key? key}) : super(key: key);

  @override
  State<RecuperarSenhaPage> createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // pesquisar pra saber se tem como colocar sem appbar...
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            color: Colors.black,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'BankGothic md BT Medium',
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Por favor, informe seu E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para a restauração de sua senha.",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'BankGothic md BT Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        // icon do TextField
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      minimumSize: Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: () {},
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'ENVIAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
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
