import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AlertaModel {

  String descricao;
  String titiulo;
  bool valido;
  GeoPoint posicao;
  int tipo_ocorrencia;
  DateTime data_ocorrencia;

  AlertaModel(this.descricao, this.titiulo, this.valido, this.posicao,
      this.tipo_ocorrencia , this.data_ocorrencia);
}