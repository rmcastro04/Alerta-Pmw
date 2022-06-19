import 'dart:async';

/*import 'package:cloud_firestore/cloud_firestore.dart';*/
import 'package:alerta_pmw/database/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AlertasController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;

  late StreamSubscription<Position> positionStream;
  static const LatLng _position = LatLng(-10.2549636, -48.3331159);
  late GoogleMapController _mapsController;
  final makers = Set<Marker>();

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
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(),
              'assets/images/alerta_nao_validado.png'),
          onTap: () {}),
    );
    update();
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

  saveMakerMap(LatLng latLng){
    print('############################');
    print(latLng);
    print('############################');
  }
}
