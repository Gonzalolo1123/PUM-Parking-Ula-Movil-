// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeleccionarVehiculo extends StatefulWidget {
  @override
  _SeleccionarVehiculoState createState() => _SeleccionarVehiculoState();
}

class _SeleccionarVehiculoState extends State<SeleccionarVehiculo> {
  List<Map<String, dynamic>> vehiculos = [];

  @override
  void initState() {
    super.initState();
    recibirDatos();
  }

  Future<void> recibirDatos() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/vehiculos'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Seleccionar Vehículo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
            ),
            const SizedBox(height: 70.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Seleccionar Auto',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF003DA6), width: 2.0),
                      ),
                    ),
                    items: vehiculos.map((vehiculo) {
                      return DropdownMenuItem<String>(
                        value: vehiculo['patente'],
                        child: Text(
                            '${vehiculo['patente']} - ${vehiculo['modelo']}'),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      if (value != null) {}
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String vehiculoSeleccionado = 'Toyota Yaris';
                // Lógica para el botón de Edificio
                print('seleccionar Vehiculo Auto ha sido presionado!');
                Navigator.pop(context, vehiculoSeleccionado);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Registrar Auto',
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
    );
  }
}
