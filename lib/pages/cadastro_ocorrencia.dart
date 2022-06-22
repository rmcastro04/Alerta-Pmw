import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CadastrarCorrenciaPage extends StatefulWidget {
  const CadastrarCorrenciaPage({Key? key}) : super(key: key);

  @override
  State<CadastrarCorrenciaPage> createState() => _CadastrarCorrenciaPageState();
}

class _CadastrarCorrenciaPageState extends State<CadastrarCorrenciaPage> {
  final _formKey = GlobalKey<FormState>();
  final dropValue = ValueNotifier('');
  final dropOpcoes = [
    'Roubo de Veículos',
    'Furto de Veículos',
    'Roubo de documentos/celular/objetos',
    'Furto de documentos/celular/objetos'
  ];

  DateTime data = DateTime(2022, 12, 24);
  TimeOfDay hora = const TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
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
          body: Center(
            child: Padding(
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
                                    onChanged: (escolha) =>
                                        dropValue.value = escolha.toString(),
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
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white70,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 60),
                            ),
                            icon: const Icon(
                              Icons.date_range,
                              color: Colors.black,
                            ),
                            label: const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Selecione a data da ocorrência',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: data,
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2023),
                              );
                              if (newDate == null) return;
                              setState(() {
                                data = newDate;
                              });
                            },
                          ),
                          const SizedBox(height: 14),
                          //Text('$hora'), Mostrar horas!!!
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white70,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 60),
                            ),
                            icon: const Icon(
                              Icons.av_timer_rounded,
                              color: Colors.black,
                            ),
                            label: const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Selecione a data da ocorrência',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: hora,
                              );
                              if (newTime == null) return;
                              setState(() {
                                hora = newTime;
                              });
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            minLines: 6,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(115, 182, 181, 181)
                                  .withOpacity(0.3),
                              filled: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Adicione uma descrição...',
                              hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.amber,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 60),
                            ),
                            onPressed: () {},
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
        ),
      ],
    );
  }
}
