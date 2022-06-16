import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/custom_drawer.dart';

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

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: Center(
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
              drawer: const CustomDrawer(),
            ),
          ),
        ),
      ],
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
