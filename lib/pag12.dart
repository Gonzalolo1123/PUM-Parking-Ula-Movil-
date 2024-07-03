// Importaciones necesarias
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Importaciones de pantallas específicas de edificios
import 'estacionamientoAVGuardia.dart';
import 'estacionamientoCentralGuardia.dart';
import 'estacionamientoMeyerGuardia.dart';

class IndexSeguridad extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _IndexSeguridadState createState() => _IndexSeguridadState();
}

class _IndexSeguridadState extends State<IndexSeguridad> {
  // Método para seleccionar el guardia y dirigir a la pantalla correspondiente
  Future<void> _selectGuardia() async {
    try {
      // Hacer la solicitud GET para obtener los datos del guardia
      final Uri url = Uri.parse('https://website-parking-ulagos.onrender.com/usuarios/selectGuardia');
      final response =
          await http.get(url); // Cambiado a GET según tu comentario

      if (response.statusCode == 200) {
        // Parsear la respuesta JSON
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> guardiaData = responseData['guardiaReporte'];

        final String nombreEdificio = guardiaData['nombre_edificio'];
        final String nombreSede = guardiaData['nombre_sede'];

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inicio de Sesión exitoso')),
        );

// Navegar a diferentes páginas según el tipo de usuario
        if (nombreSede == 'Chuyaca') {
          switch (nombreEdificio) {
            case 'Central':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EstacionamientoCentralGuardia(),
                ),
              );
              break;

            case 'Aulas Virtuales':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EstacionamientoAVGuardia(),
                ),
              );
              break;

            case 'ITR':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EstacionamientoAVGuardia(), // Asegúrate de tener esta clase
                ),
              );
              break;

            case 'SEMDA':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EstacionamientoAVGuardia(), // Asegúrate de tener esta clase
                ),
              );
              break;

            case 'Gimnasio 1':
              print('Gimnasio 1');
              /*Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EstacionamientoGimnasio1Guardia(), // Asegúrate de tener esta clase
                ),
              );*/
              break;

            case 'docentes':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EstacionamientoAVGuardia(), // Asegúrate de tener esta clase
                ),
              );
              break;

            default:
              // Si el edificio no está reconocido, puedes manejarlo como desees
              print('Edificio no reconocido: $nombreEdificio');
              break;
          }
        } else {
          // Si la sede no es 'Chuyaca', navegar a la pantalla de Meyer Guardia
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EstacionamientoMeyerGuardia(),
            ),
          );
        }
      } else {
        // Mostrar mensaje de error si no se pudo obtener los datos del guardia
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al obtener datos del guardia')),
        );
        print('Error de estado: ${response.statusCode}');
      }
    } catch (e) {
      // Capturar errores de conexión u otros
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  width: 100, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // Lógica cuando la imagen es presionada
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
                  width: 100, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.topRight,
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
              ],
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _selectGuardia,
            child: Text('Seleccionar Guardia'),
          ),
        ),
      ),
    );
  }
}
