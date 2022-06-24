import 'dart:async';

/*import 'package:cloud_firestore/cloud_firestore.dart';*/
import 'package:alerta_pmw/database/db.dart';
import 'package:alerta_pmw/model/alerta_model.dart';
import 'package:alerta_pmw/widgets/alerta_detalhes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AlertasController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;

  //late final BuildContext context;

  late Function? showDetailAlert;

  late StreamSubscription<Position> positionStream;
  static const LatLng _position = LatLng(-10.2549636, -48.3331159);
  late GoogleMapController _mapsController;
  final makers = <Marker>{};

  static AlertasController get to => Get.find<AlertasController>();

  get mapsController => _mapsController;

  get position => _position;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    loadAlertas();
  }

  loadAlertas() async {
    FirebaseFirestore db = DB.get();
    final alertas = await db.collection('Alertas').get();

    alertas.docs.forEach((alerta) => addMarker(alerta));
  }

  addMarker(alerta) async {
    GeoPoint point = alerta.get('position');

    makers.add(
      Marker(
          markerId: MarkerId(alerta.id),
          position: LatLng(point.latitude, point.longitude),
          infoWindow: InfoWindow(title: alerta.get('ocorrencia')),
          icon: await iconMakers(alerta),
          // icon: await BitmapDescriptor.fromAssetImage(
          //     ImageConfiguration(), 'assets/images/alerta_nao_validado.png'),
          onTap: () => {showModal(alerta.data())} // showModal(alerta.data()),
      ),
    );
    update();
  }

  showModal(alerta) {
    DateTime data_ocorrencia = DateTime.parse(
        alerta['data_ocorrencia'].toDate().toString());
    AlertaModel alertaModel = AlertaModel(
        alerta['descricao'],
        alerta['ocorrencia'],
        alerta['valido'],
        alerta['position'],
        alerta['tipo_ocorrencia'],
        data_ocorrencia
    );

    showDetailAlert!(alertaModel);

    // Get.bottomSheet(
    //   AlertaDetalhes(),
    //   barrierColor: Colors.white
    // );
    // print('###########################################################################################');
    // print(alerta);

    // showMaterialModalBottomSheet(
    //   context: context,
    //   builder: (context) => Container(),
    // );

    /* showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    ); */
  }

  Future<BitmapDescriptor> iconMakers(alerta) async {
    if (alerta.get('tipo_ocorrencia') == 1) {
      if (alerta.get('valido')) {
        return await BitmapDescriptor.fromAssetImage(ImageConfiguration(),
            'assets/images/makers/roubo_Validado_tipo_1.png');
      }
      return await BitmapDescriptor.fromAssetImage(ImageConfiguration(),
          'assets/images/makers/roubo_naoValidado_tipo_1.png');
    } else if (alerta.get('tipo_ocorrencia') == 2) {
      if (alerta.get('valido')) {
        return await BitmapDescriptor.fromAssetImage(ImageConfiguration(),
            'assets/images/makers/roubo_Validado_tipo_2.png');
      }
      return await BitmapDescriptor.fromAssetImage(ImageConfiguration(),
          'assets/images/makers/roubo_naoValidado_tipo_2.png');
    }

    return await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/alerta_nao_validado.png');
  }

  watchPosicao() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      if (position != null) {
        latitude.value = position.latitude;
        longitude.value = position.longitude;
      }
    });
  }

  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone.');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização.');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Autorize o acesso à localização nas configurações.');
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosicao() async {
    try {
      final posicao = await _posicaoAtual();
      latitude.value = posicao.latitude;
      longitude.value = posicao.longitude;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  saveMakerMap(LatLng latLng, String titulo, DateTime data_ocorrencia,
      String descricao, int tipo) async {
    FirebaseFirestore db = DB.get();
    db.collection('Alertas').add({
      'data_ocorrencia': Timestamp.fromDate(data_ocorrencia),
      'descricao': descricao,
      'ocorrencia': titulo,
      'position': GeoPoint(latLng.latitude, latLng.longitude),
      'tipo_ocorrencia': tipo,
      'valido': false
    });
  }

  setContext(Function(AlertaModel e) showDetail) {
    showDetailAlert = showDetail;
    //context = cont;
  }
}
