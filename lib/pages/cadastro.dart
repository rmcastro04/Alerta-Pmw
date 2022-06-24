import 'package:alerta_pmw/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const CadastroPage({Key? key, required this.onClickedSignIn})
      : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

/////////////////////
class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCadastroController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController senhaController1 = TextEditingController();
  final TextEditingController senhaController2 = TextEditingController();
  bool _obscurePasswordCadastro = true;

  @override
  void dispose() {
    emailCadastroController.dispose();
    senhaController1.dispose();
    super.dispose();
  }

  signUp() async {
    try {
      await context
          .read<AuthService>()
          .signUp(emailCadastroController.text, senhaController1.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          controller: nomeController,
                          decoration: const InputDecoration(
                            labelText: 'Nome completo do usuário',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              // icTextFormField
                              Icons.account_circle_rounded,
                              color: Colors.black,
                            ),
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe o e-mail';
                            } else if (!value.contains("@")) {
                              return 'E-mail invalido';
                            }
                            return null;
                          },
                          controller: emailCadastroController,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          obscureText: _obscurePasswordCadastro,
                          controller: senhaController2,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              // icTextFormField
                              Icons.lock_outline_rounded,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _obscurePasswordCadastro == false
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  _obscurePasswordCadastro =
                                      !_obscurePasswordCadastro;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informa sua senha!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          obscureText: _obscurePasswordCadastro,
                          controller: senhaController1,
                          decoration: InputDecoration(
                            labelText: 'Confirmar senha',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              // icTextFormField
                              Icons.lock_outline_rounded,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _obscurePasswordCadastro == false
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  _obscurePasswordCadastro =
                                      !_obscurePasswordCadastro;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            //print(senhaController1);
                            if (value!.isEmpty) {
                              return 'Informa sua senha!';
                            } else if (senhaController1.value !=
                                senhaController2.value) {
                              return 'Senha divergente';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 60),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signUp();
                            }
                          },
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
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'Possui conta?',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignIn,
                                text: 'Login',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
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
