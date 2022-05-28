import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

void validar() {}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

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
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
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
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Nome completo do usuário',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              // icTextFormField
                              Icons.account_circle_rounded,
                              color: Colors.black,
                            ),
                            // errorText 'xxx' informar erro dentro de uma validaçao  $variavel
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              // icTextFormField
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              // icTextFormField
                              Icons.lock_outline_rounded,
                              color: Colors.black,
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Confirmar senha',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              // icTextFormField
                              Icons.lock_outline_rounded,
                              color: Colors.black,
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 60),
                          ),
                          onPressed: () {},
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
