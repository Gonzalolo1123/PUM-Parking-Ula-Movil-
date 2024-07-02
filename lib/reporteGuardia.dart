// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportesGuardia extends StatefulWidget {
  final String idEspacio;
  final String Edificio;

  ReportesGuardia({required this.idEspacio, required this.Edificio});

  @override
  _ReportesGuardiaState createState() => _ReportesGuardiaState();
}

class _ReportesGuardiaState extends State<ReportesGuardia> {
  final TextEditingController patenteController = TextEditingController();
  final TextEditingController reporteController = TextEditingController();

  Future<void> submitReport() async {
    final String patente = patenteController.text;
    final String reporte = reporteController.text;

    final Uri url = Uri.parse('http://10.0.2.2:3000/usuarios/reporteGuardia');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id_espacio': widget.idEspacio,
        'patente': patente,
        'reporte': reporte,
      }),
    );

    if (response.statusCode == 200) {
      print('Report submitted successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Report submitted successfully')),
      );
    } else {
      print('Failed to submit report');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit report')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String idEspacio = widget.idEspacio;
    String Edificio = widget.Edificio;

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFF003DA6),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 100),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoSEG.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoGPS.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    'Registro de Reporte',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edificio: $Edificio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Estacionamiento: $idEspacio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: patenteController,
                          decoration: const InputDecoration(
                            labelText: 'Patente',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Color(0xFF003DA6),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: 300,
                        height: 120,
                        child: TextFormField(
                          controller: reporteController,
                          decoration: const InputDecoration(
                            labelText: 'Reporte',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Color(0xFF003DA6),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          print('Enviar Reporte ha sido presionado!');
                          submitReport();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 40),
                          padding: const EdgeInsets.all(10.0),
                          side: const BorderSide(
                            width: 2.0,
                            color: Color(0xFF003DA6),
                          ),
                        ),
                        child: const Text(
                          'Enviar Reporte',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF003DA6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
