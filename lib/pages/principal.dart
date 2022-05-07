import 'package:flutter/material.dart';

class PrinciapalPage extends StatefulWidget {
  const PrinciapalPage({Key? key}) : super(key: key);

  @override
  State<PrinciapalPage> createState() => _PrinciapalPageState();
}

class _PrinciapalPageState extends State<PrinciapalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
