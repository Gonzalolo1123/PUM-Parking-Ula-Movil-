// ignore_for_file: prefer_const_constructors, avoid_print, use_super_parameters, prefer_const_constructors_in_immutables, non_constant_identifier_names, unnecessary_this, avoid_web_libraries_in_flutter, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pum/pag14.dart';
import 'package:http/http.dart' as http;

class ConfirmacionReserva extends StatelessWidget {
  final String HoraEntradaSel;
  final String HoraSalidaSel;
  final String EdiSel;
  final String VehSel;
  final String idEspacioSel;

  const ConfirmacionReserva({
    required this.EdiSel,
    required this.VehSel,
    required this.idEspacioSel,
    Key? key,
    required this.HoraEntradaSel,
    required this.HoraSalidaSel,
    required String SedeSel,
  }) : super(key: key);

  Future<void> registrarReserva(BuildContext context) async {
    // Datos a enviar
    Map<String, String> datos = {
      'edificio': EdiSel,
      'patente': VehSel,
      'id_espacio': idEspacioSel,
      'hora_entrada': HoraEntradaSel,
      'hora_salida': HoraSalidaSel,
    };

    try {
      final response = await http.post(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/reserva'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datos),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reserva registrada exitosamente')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReservaCompletada()),
        );
      } else if (response.statusCode == 121) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ya tienes una reserva')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReservaCompletada()),
        );
      } else {
        // Manejo de otros posibles estados de respuesta
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error al registrar la reserva: ${response.body}')),
        );
      }
    } catch (e) {
      // Mostrar mensaje de error si hay un error de conexión
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión')),
      );
      // Imprimir el mensaje de error en la consola
      print('Error de conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 560, // Ajusta la altura según sea necesario
      width: screenWidth,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 6),
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Confirmación Reserva',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edificio',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Text(
                  EdiSel,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Estacionamiento',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 10),
                Text(
                  idEspacioSel, // Usando idEspacioSel en lugar de un valor fijo 'AV001'
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Hora',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Text(
                  '$HoraEntradaSel - $HoraSalidaSel', // Usando HoraSel en lugar de un valor fijo '00:00 hrs'
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Patente',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 10),
                Text(
                  VehSel, // Usando VehSel en lugar de un valor fijo 'Mediano'
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para el botón de Reservar
              print('Reservar ha sido presionado!');
              registrarReserva(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(320, 40),
              padding: const EdgeInsets.all(10.0),
              side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
            ),
            child: const Text(
              'Reservar',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF003DA6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
