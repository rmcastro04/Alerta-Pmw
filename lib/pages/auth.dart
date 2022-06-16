import 'package:alerta_pmw/pages/cadastro.dart';
import 'package:alerta_pmw/pages/login.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedSignUp: alternar)
      : CadastroPage(onClickedSignIn: alternar);

  void alternar() => setState(() => isLogin = !isLogin);
}
