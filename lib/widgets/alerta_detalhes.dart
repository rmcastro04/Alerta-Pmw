import 'package:alerta_pmw/model/alerta_model.dart';
import 'package:flutter/material.dart';

class AlertaDetalhes extends StatelessWidget {
  const AlertaDetalhes({Key? key, required this.alerta}) : super(key: key);

  //final alerta = {};
  final AlertaModel alerta;

  @override
  Widget build(BuildContext context) {
    // Ve se capricha
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  alerta.titiulo,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(alerta.tipo_ocorrencia == 1 ? 'Furto' : 'Roubo',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(alerta.valido == true ? 'Validado' : 'Não validado',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(formartData(alerta.data_ocorrencia),
                    style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Text(alerta.descricao, style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  String formartData(DateTime data) {
    String data_hora =
        "${data.day}/${data.month}/${data.year} ${data.hour}:${data.minute}";

    return data_hora;
  }
}
