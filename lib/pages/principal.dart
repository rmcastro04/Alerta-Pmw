import 'package:alerta_pmw/controllers/alerta_controller.dart';
import 'package:alerta_pmw/controllers/mensage_flutuante.dart';
import 'package:alerta_pmw/model/alerta_model.dart';
import 'package:alerta_pmw/widgets/alerta_detalhes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../widgets/custom_drawer.dart';
import 'cadastro_ocorrencia.dart';

import 'dart:async';

class PrinciapalPage extends StatefulWidget {
  const PrinciapalPage({Key? key}) : super(key: key);

  @override
  State<PrinciapalPage> createState() => _PrinciapalPageState();
}

class _PrinciapalPageState extends State<PrinciapalPage> {
  /*static const __initialCameraPosition = CameraPosition(
    target: LatLng(-10.2549636, -48.3331159),
    zoom: 11.5,
  );*/
  bool telaAddOcorrencia = false;
  bool mostrarFloatButton = false;

  final _pageController = PageController();
  final mensagem = Get.put(MensagemFloat());

  final makersTemp = <Marker>{};

  late LatLng posicao_nova_ocorrencia;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlertasController());

    controller.setContext(showModal);

    return PageView(
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            //toolbarHeight: 70,
            centerTitle: true,
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
            leading: telaAddOcorrencia
                ? IconButton(
                onPressed: () {
                  setState(() => telaAddOcorrencia = !telaAddOcorrencia);
                  mensagem.recolherMensagem(context);
                  mostrarFloatButton = false;
                  makersTemp.clear();
                },
                icon: const Icon(Icons.arrow_back_sharp))
                : null,
          ),
          body: GetBuilder<AlertasController>(
            init: controller,
            builder: (value) =>
                GoogleMap(
                  mapToolbarEnabled: false,
                  /*myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: __initialCameraPosition,*/
                  mapType: MapType.normal,
                  zoomControlsEnabled: true,
                  initialCameraPosition:
                  CameraPosition(target: controller.position, zoom: 13),
                  onMapCreated: controller.onMapCreated,
                  myLocationEnabled: true,
                  markers: !telaAddOcorrencia ? controller.makers : makersTemp,
                  onTap: (e) async {
                    if (telaAddOcorrencia) {
                      Marker ocorrencia = Marker(
                        markerId: const MarkerId('ocorrencia'),
                        infoWindow: const InfoWindow(
                            title: 'Local da Ocorrencia'),
                        icon: await BitmapDescriptor.fromAssetImage(
                            ImageConfiguration(),
                            'assets/images/makers/posicao_inicial.png'),
                        // icon: BitmapDescriptor.defaultMarkerWithHue(
                        //     BitmapDescriptor.hueRed),
                        position: e,
                      );

                      setState(() {
                        posicao_nova_ocorrencia = e;
                        makersTemp.add(ocorrencia);
                        mostrarFloatButton = true;
                      });
                    }
                  },
                ),
          ),
          drawer:
          !telaAddOcorrencia ? CustomDrawer(mudarTela: mudarTela) : null,
          floatingActionButton: mostrarFloatButton && telaAddOcorrencia
              ? FloatingActionButton.extended(
            onPressed: () {
              mensagem.recolherMensagem(context);
              //mostrarFloatButton = false;
              // mensagem.recolherMensagem();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CadastrarCorrenciaPage(
                          posicao_nova_ocorrencia: posicao_nova_ocorrencia),
                ),
              );

              // showMaterialModalBottomSheet(
              //   context: context,
              //   builder: (context) => Container(
              //   ),
              //   elevation: 50.0
              // );
            },
            label: const Text('Confirmar'),
            icon: const Icon(Icons.thumb_up),
            backgroundColor: Colors.amber,
          )
              : null,
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }

  void mudarTela(context) {
    setState(() {
      telaAddOcorrencia = !telaAddOcorrencia;
      mensagem.exibirMensagem(context);
    });
  }

  void showModal(AlertaModel alertaModel) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.4,
            child: AlertaDetalhes(alerta: alertaModel)
          );
        }
    );
  }
}