// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'estacionamientoAVGuardia.dart';
import 'estacionamientoCentralGuardia.dart';
import 'estacionamientoMeyerGuardia.dart';

class IndexSeguridad extends StatefulWidget {
  final String? usuarioId;
  IndexSeguridad(this.usuarioId);

  @override
  _IndexSeguridadState createState() => _IndexSeguridadState();
}

class _IndexSeguridadState extends State<IndexSeguridad> {
  String? _usuarioId;

  @override
  void initState() {
    super.initState();
    _usuarioId = widget.usuarioId;
  }

  Future<void> _selectGuardia() async {
    try {
      final Uri url = Uri.parse(
          'https://website-parking-ulagos.onrender.com/usuarios/selectGuardia?usuarioId=${_usuarioId!}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> guardiaData = responseData['guardiaReporte'];

        final String nombreEdificio = guardiaData['nombre_edificio'];
        final String nombreSede = guardiaData['nombre_sede'];

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inicio de Sesión exitoso')),
        );

        if (nombreSede == 'Chuyaca') {
          switch (nombreEdificio) {
            case 'Central':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EstacionamientoCentralGuardia(_usuarioId!),
                ),
              );
              break;
            case 'Aulas Virtuales':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstacionamientoAVGuardia(_usuarioId!),
                ),
              );
              break;
            case 'ITR':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstacionamientoAVGuardia(_usuarioId!),
                ),
              );
              break;
            case 'SEMDA':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstacionamientoAVGuardia(_usuarioId!),
                ),
              );
              break;
            case 'Gimnasio 1':
              print('Gimnasio 1');
              break;
            case 'docentes':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstacionamientoAVGuardia(_usuarioId!),
                ),
              );
              break;
            default:
              print('Edificio no reconocido: $nombreEdificio');
              break;
          }
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EstacionamientoMeyerGuardia(_usuarioId!),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al obtener datos del guardia')),
        );
        print('Error de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('¿Estás seguro?'),
            content: Text('¿Quieres salir de la Plataforma de Seguridad?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Sí'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: const Color(0xFF003DA6),
              flexibleSpace: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sección de Seguridad de la Universidad',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'En esta sección, puedes acceder al mapa designado por el administrador. '
                  'Presiona el botón a continuación para continuar.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _selectGuardia,
                  child: Text('Seleccionar Guardia'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
