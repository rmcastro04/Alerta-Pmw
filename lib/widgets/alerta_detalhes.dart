import 'package:alerta_pmw/model/alerta_model.dart';
import 'package:flutter/material.dart';

class AlertaDetalhes extends StatelessWidget {
  const AlertaDetalhes({Key? key, required this.alerta}) : super(key: key);

  //final alerta = {};
  final AlertaModel alerta;

  @override
  Widget build(BuildContext context) {
  //

    return Container(

      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(

          children: <Widget>[
              Row(
                children: <Widget>[
                    Text("Ocorrências Detalhadas:", style: TextStyle(fontSize: 20)),
                  ],
              ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Titulo:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 5,),

            Row(
              children: <Widget>[
                Text(alerta.titiulo.toString(),style: TextStyle(fontSize: 17,),),
              ],
            ),



            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Tipo:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 5,),

            Row(
              children: <Widget>[
                Text(alerta.tipo_ocorrencia == 1 ? 'Furto' : 'Assalto' ,style: TextStyle(fontSize: 17,),),
              ],
            ),


            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Data:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 5,),

            Row(
              children: <Widget>[
                Text(alerta.data_ocorrencia.toString(),style: TextStyle(fontSize: 17,),),
              ],
            ),


            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Local:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 5,),

            Row(
              children: <Widget>[
                Text(alerta.posicao.toString(),style: TextStyle(fontSize: 17,),),
              ],
            ),

            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Descrição:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 5,),

            Row(
              children: <Widget>[
                Text(alerta.descricao.toString(),style: TextStyle(fontSize: 17,),),
              ],
            ),


            ],

        )


      ),

      


    );
  }
}
