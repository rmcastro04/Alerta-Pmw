import 'package:alerta_pmw/pages/recuperar_senha.dart';
import 'package:alerta_pmw/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  signIn() async {
    try {
      await context
          .read<AuthService>()
          .signIn(emailController.text, senhaController.text);
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
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: senhaController,
                          obscureText: _obscurePassword,
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
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _obscurePassword == false
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe sua senha';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        const SizedBox(height: 21),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            minimumSize: const Size.fromHeight(60),
                          ),
                          //onPressed: signIn,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signIn();
                            }
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
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(60),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 28, 27, 27)),
                          ),
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Entrar com o google',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 8),
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
                            RichText(
                              text: TextSpan(
                                text: 'Não possui conta?',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = widget.onClickedSignUp,
                                    text: 'Registrar',
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
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
