import 'package:alerta_pmw/model/alerta_model.dart';
import 'package:flutter/material.dart';

class AlertaDetalhes extends StatelessWidget {
  const AlertaDetalhes({Key? key, required this.alerta}) : super(key: key);

  //final alerta = {};
  final AlertaModel alerta;

  @override
  Widget build(BuildContext context) {
  // Ve se capricha
    return Container(
      color: Colors.white,
      child: Text(alerta.data_ocorrencia.toString())
    );
  }
}
