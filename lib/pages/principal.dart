import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PrinciapalPage extends StatefulWidget {
  const PrinciapalPage({Key? key}) : super(key: key);

  @override
  State<PrinciapalPage> createState() => _PrinciapalPageState();
}

class _PrinciapalPageState extends State<PrinciapalPage> {
  static const __initialCameraPosition = CameraPosition(
    target: LatLng(-10.2549636, -48.3331159),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // retirar botão voltar.
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
          drawer: Drawer(
            child: Center(
              child: ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: const Text('Sair'),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroPage(), //Provisorio
                ),
              );*/
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
    /*return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.black,
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: __initialCameraPosition,
      ),
    );*/
  }
}