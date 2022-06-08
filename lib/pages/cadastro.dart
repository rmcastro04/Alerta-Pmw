import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const CadastroPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController1 = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    senhaController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.white,
          // pesquisar pra saber se tem como colocar sem appbar...
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            color: Colors.black,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),*/
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "INICIE O SEU CADASTRO",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'BankGothic md BT Medium',
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome completo do usuário',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        // icon do TextField
                        Icons.account_circle_rounded,
                        color: Colors.black,
                      ),
                      // errorText 'xxx' informar erro dentro de uma validaçao  $variavel
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        // icon do TextField
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        // icon do TextField
                        Icons.lock_outline_rounded,
                        color: Colors.black,
                      ),
                    ),
                    obscureText: true,
                    controller: senhaController1,
                  ),
                  const SizedBox(height: 14),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        // icon do TextField
                        Icons.lock_outline_rounded,
                        color: Colors.black,
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: signUp,
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'CADASTRAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Possui conta?',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan> [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignIn,
                              text: 'Login',
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              )
                          )
                        ]
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
  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: senhaController1.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
