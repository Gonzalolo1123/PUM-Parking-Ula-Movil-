// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ReservaCompletada extends StatefulWidget {
  final String UsuarioId;
  const ReservaCompletada(this.UsuarioId);

  @override
  _ReservaCompletadaState createState() => _ReservaCompletadaState();
}

class _ReservaCompletadaState extends State<ReservaCompletada> {
  // Definición de variables para almacenar datos de reserva
  String Edificio = '';
  String idEspacio = '';
  String patente = '';
  String horaEntrada = '';
  String horaSalida = '';
  String? _usuarioId;

  @override
  void initState() {
    super.initState();
    _usuarioId = widget.UsuarioId;
    _selectReserva();
  }

  Future<void> _selectReserva() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/selectReserva?usuarioId=${_usuarioId!}'), // Endpoint correcto para selectReserva
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parsear la respuesta JSON
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey('reserva')) {
          final Map<String, dynamic> reserva = responseData['reserva'];

          // Formatear las horas
          final entrada = DateTime.parse(reserva['hora_entrada_reserva']);
          final salida = DateTime.parse(reserva['hora_salida_reserva']);
          final formatoHora = DateFormat('HH:mm');

          // Actualizar las variables de estado con los datos de la reserva
          setState(() {
            Edificio = reserva['nombre_edificio'] ?? '';
            idEspacio = reserva['id_espacio']?.toString() ?? '';
            patente = reserva['patente'] ?? '';
            // Dentro de _selectReserva en _ReservaCompletadaState
            final entrada = DateTime.parse(reserva['hora_entrada_reserva'])
                .add(Duration(hours: 4));
            final salida = DateTime.parse(reserva['hora_salida_reserva'])
                .add(Duration(hours: 4));

// Formatear las horas sumando 4 horas
            horaEntrada = formatoHora.format(entrada);
            horaSalida = formatoHora.format(salida);
          });

          // Mostrar mensaje o realizar acciones según la respuesta
          print('Reserva encontrada');
        } else {
          // Mostrar mensaje de error si no se encontró 'reserva' en la respuesta
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No se encontró reserva')),
          );
        }
      } else {
        // Mostrar mensaje de error si la solicitud falla
        print('Error al obtener la reserva: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al obtener la reserva')),
        );
      }
    } catch (e) {
      // Mostrar mensaje de error si hay un problema de conexión
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  Future<void> _eliminarReserva(String patente, String idEspacio,usuarioId) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/reservaEliminar'), // Endpoint para eliminarReserva
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"patente": patente, "id_espacio": idEspacio,"usuarioId":usuarioId}),
      );

      if (response.statusCode == 201) {
        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reserva eliminada correctamente')),
        );

        // Navegar de regreso a la pantalla anterior
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        // Mostrar mensaje de error si falla la eliminación
        print('Error al eliminar la reserva ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al eliminar la reserva')),
        );
      }
    } catch (e) {
      // Mostrar mensaje de error si hay un problema de conexión
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  Future<void> _aumentarReserva(
      String patente, String idEspacio, String usuarioId) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/reservaActualizar}'), // Endpoint para aumentarReserva
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "patente": patente,
          "id_espacio": idEspacio,
          "usuarioId": usuarioId
        }),
      );

      if (response.statusCode == 201) {
        // Mostrar mensaje o realizar acciones según la respuesta
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reserva aumentada correctamente')),
        );

        // Navegar de regreso a la pantalla anterior
        Navigator.pop(context);
      } else {
        // Mostrar mensaje de error si no se pudo aumentar la reserva
        print('Error al aumentar la reserva ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al aumentar la reserva')),
        );
      }
    } catch (e) {
      // Mostrar mensaje de error si hay un problema de conexión
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión')),
      );
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
                // Lógica cuando la imagen es presionada
                print('Imagen presionada');
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
            const SizedBox(
              width: 350,
              height: 70,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '¡Tienes una reserva!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edificio',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 10.0),
                      Text(
                        Edificio,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estacionamiento',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 10.0),
                      Text(
                        idEspacio,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hora',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 10.0),
                      Text(
                        '$horaEntrada - $horaSalida',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patente',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 10.0),
                      Text(
                        patente,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Mostrar un diálogo de confirmación antes de eliminar la reserva
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmación'),
                      content: Text('¿Está seguro de eliminar esta reserva?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Retrocede una página
                          },
                        ),
                        TextButton(
                          child: Text('Sí'),
                          onPressed: () {
                            // Llamar a la función para eliminar la reserva
                            _eliminarReserva(patente, idEspacio, _usuarioId!);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Finalizar Reserva',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Mostrar un diálogo de confirmación antes de aumentar la reserva
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmación'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('¿Está seguro de aumentar esta reserva?'),
                          const SizedBox(height: 10),
                          Text('Solo se puede aumentar 1 vez'),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Retrocede una página
                          },
                        ),
                        TextButton(
                          child: Text('Sí'),
                          onPressed: () {
                            // Llamar al método para aumentar la reserva
                            _aumentarReserva(patente, idEspacio, _usuarioId!);
                            Navigator.of(context)
                                .pop(); // Cerrar el diálogo de confirmación
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Aumentar Reserva',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            // Otros widgets que tengas en tu columna
          ],
        ),
      ),
    );
  }
}
