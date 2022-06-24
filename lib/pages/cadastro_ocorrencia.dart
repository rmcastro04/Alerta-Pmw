import 'package:alerta_pmw/controllers/alerta_controller.dart';
import 'package:alerta_pmw/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastrarCorrenciaPage extends StatefulWidget {
  const CadastrarCorrenciaPage(
      {Key? key, required this.posicao_nova_ocorrencia})
      : super(key: key);

  final LatLng posicao_nova_ocorrencia;

  @override
  State<CadastrarCorrenciaPage> createState() => _CadastrarCorrenciaPageState();
}

class _CadastrarCorrenciaPageState extends State<CadastrarCorrenciaPage> {
  final _formKey = GlobalKey<FormState>();
  final dropValue = ValueNotifier('');

  final dropOpcoes = [
    'Furto',
    'Roubo',
  ];

  static const VALOR_TIPO_OCORRENCIA = {
    'Furto': 1,
    'Roubo': 2,
  };

  late TextEditingController data_controler;
  TextEditingController titulo_controler = TextEditingController();
  TextEditingController hora_controler = TextEditingController();
  TextEditingController descricao_controler = TextEditingController();
  late int? tipo_ocorrencia;

  final controller = Get.put(AlertasController());

  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    data_controler = TextEditingController(
        text: "${dateTime.day}/${dateTime.month}/${dateTime.year}");
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
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
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "ADICIONAR OCORRÊNCIA",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'BankGothic md BT Medium',
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                          controller: titulo_controler,
                          decoration: const InputDecoration(
                              labelText: 'Título',
                              border: OutlineInputBorder(),
                              hintText: '(Ex..: Roubaram minha moto)'),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: <Widget>[
                            const Text(
                              "Selecione o tipo de ocorrência",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              child: const Icon(Icons.info_outline_rounded),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        ValueListenableBuilder(
                            valueListenable: dropValue,
                            builder: (BuildContext context, String value, _) {
                              return SizedBox(
                                width: 500,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  value: (value.isEmpty) ? null : value,
                                  onChanged: (escolha) => {
                                    dropValue.value = escolha.toString(),
                                    tipo_ocorrencia = VALOR_TIPO_OCORRENCIA[
                                        escolha.toString()],
                                  },
                                  items: dropOpcoes
                                      .map((op) => DropdownMenuItem(
                                            value: op,
                                            child: Text(op),
                                          ))
                                      .toList(),
                                ),
                              );
                            }),
                        const SizedBox(height: 14),
                        TextField(
                          controller: data_controler,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite a data da ocorrência',
                              suffixIcon: Icon(Icons.calendar_month)),
                          inputFormatters: [
                            MaskTextInputFormatter(
                                mask: '##/##/####',
                                filter: {"#": RegExp(r'[0-9]')},
                                type: MaskAutoCompletionType.lazy),
                          ],
                        ),
                        const SizedBox(height: 14),
                        TextField(
                          controller: hora_controler,
                          keyboardType: TextInputType.none,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite a hora da ocorrência',
                              suffixIcon: Icon(Icons.av_timer_outlined)),
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: '##:##',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy,
                            ),
                          ],
                          onTap: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (newTime == null) return;
                            setState(() {
                              hora_controler.text =
                                  "${newTime.hour}:${newTime.minute}";
                            });
                          },
                        ),
                        const SizedBox(height: 14),
                        TextField(
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: descricao_controler,
                          decoration: const InputDecoration(
                            // fillColor: Color.fromARGB(115, 182, 181, 181)
                            //     .withOpacity(0.3),
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Adicione uma descrição...',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 60),
                          ),
                          onPressed: () {
                            salvarOcorrencia();
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'CADASTRAR OCORRÊNCIA',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void salvarOcorrencia() {
    var data = data_controler.text.split('/');
    var hora = hora_controler.text.split(':');

    print(data);
    print(hora);

    DateTime timestamp = DateTime(
      int.parse(data[2]),
      int.parse(data[1]),
      int.parse(data[0]),
      int.parse(hora[0]),
      int.parse(hora[1]),
    );

    controller.saveMakerMap(
        widget.posicao_nova_ocorrencia,
        titulo_controler.text,
        timestamp,
        descricao_controler.text,
        tipo_ocorrencia!);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrinciapalPage(),
      ),
    );
  }
}
