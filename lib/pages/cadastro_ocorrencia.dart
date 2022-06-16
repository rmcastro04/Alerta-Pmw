import 'package:flutter/material.dart';

class CadastrarCorrenciaPage extends StatefulWidget {
  const CadastrarCorrenciaPage({Key? key}) : super(key: key);

  @override
  State<CadastrarCorrenciaPage> createState() => _CadastrarCorrenciaPageState();
}

class _CadastrarCorrenciaPageState extends State<CadastrarCorrenciaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.black,
            title: Row(
              children: <Widget>[
                const SizedBox(width: 25),
                Image.asset(
                  'assets/images/logo.png',
                  height: 30,
                ),
                const SizedBox(width: 5),
                const Text(
                  "AlertaPMW",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'BankGothic md BT Medium',
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
