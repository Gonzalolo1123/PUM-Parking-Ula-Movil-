// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SeleccionarVehiculo extends StatefulWidget {
  @override
  _SeleccionarVehiculoState createState() => _SeleccionarVehiculoState();
}

class _SeleccionarVehiculoState extends State<SeleccionarVehiculo> {
  List<Map<String, dynamic>> vehiculos = [];
  String vehiculoSeleccionado = '';

  @override
  void initState() {
    super.initState();
    recibirDatos();
  }

  Future<void> recibirDatos() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/usuarios/vehiculos'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        setState(() {
          vehiculos = data.map((item) {
            return {
              'patente': item['patente'],
              'modelo': item['modelo'],
            };
          }).toList();
        });
      } else {
        print('Error al recibir los datos');
        print(response.statusCode);
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color(0xFF003DA6),
          flexibleSpace: Align(
            alignment: const Alignment(0.0, 0.8),
            child: GestureDetector(
              onTap: () {
                print('Imagen presionada');
                Navigator.pushNamed(context, '/');
              },
              child: Image.asset(
                'assets/logoGPS.png',
                height: 55,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Seleccionar Vehículo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: vehiculos.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        RadioListTile<String>(
                          title: Text('${vehiculos[index]['patente']} - ${vehiculos[index]['modelo']}'),
                          value: vehiculos[index]['patente'],
                          groupValue: vehiculoSeleccionado,
                          onChanged: (String? value) {
                            setState(() {
                              vehiculoSeleccionado = value!;
                            });
                          },
                        ),
                        Divider(
                          color: Colors.black54,
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (vehiculoSeleccionado.isNotEmpty) {
                    print('Registrar Auto presionado con vehículo seleccionado: $vehiculoSeleccionado');
                    Navigator.pop(context, vehiculoSeleccionado);
                  } else {
                    print('No se ha seleccionado ningún vehículo');
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 40),
                  padding: const EdgeInsets.all(10.0),
                  side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
                ),
                child: const Text(
                  'Seleccionar Auto',
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
        ),
      ),
    );
  }
}
