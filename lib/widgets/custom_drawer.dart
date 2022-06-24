import 'package:alerta_pmw/controllers/alerta_controller.dart';
import 'package:alerta_pmw/pages/cadastro_ocorrencia.dart';
import 'package:alerta_pmw/pages/principal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.mudarTela}) : super(key: key);

  final Function(BuildContext) mudarTela;

  @override
  Widget build(BuildContext context) {
    /*final controller = Get.put(AlertasController());*/

    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.all(10),
                height: 150,
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Text(
                        "AlertaPMW",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            child: const Text(
                              "Sair",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Adicionar ocorrência'),
                onTap: () {
                  mudarTela(context);
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.archive),
                title: const Text('Minhas ocorrência'),
                onTap: () {
                  mudarTela(context);
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.filter_alt),
                title: const Text('Filtrar ocorrência'),
                onTap: () {
                  mudarTela(context);
                  Navigator.of(context).pop();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
