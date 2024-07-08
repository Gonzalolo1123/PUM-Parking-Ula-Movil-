// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, use_build_context_synchronously, avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EspacioEstacionamiento {
  final String idEspacio;
  final double top;
  final double left;
  final String estado;

  EspacioEstacionamiento({
    required this.idEspacio,
    required this.top,
    required this.left,
    required this.estado,
  });

  factory EspacioEstacionamiento.fromJson(Map<String, dynamic> json) {
    return EspacioEstacionamiento(
      idEspacio: json['id_espacio'].toString(),
      top: json['top']?.toDouble() ?? 0.0,
      left: json['left']?.toDouble() ?? 0.0,
      estado: json['estado'].toString(),
    );
  }
}

class EstacionamientoAV extends StatefulWidget {
  @override
  _EstacionamientoAVState createState() => _EstacionamientoAVState();
}

class _EstacionamientoAVState extends State<EstacionamientoAV> {
  List<EspacioEstacionamiento> estacionamientos = [];

  @override
  void initState() {
    super.initState();
    _cargarEstacionamientos();
  }

  Future<void> _cargarEstacionamientos() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/selectEstacionamientoEstado'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          estacionamientos = data
              .map((item) => EspacioEstacionamiento.fromJson(item))
              .toList();
        });
      } else {
        throw Exception('Error al cargar los estacionamientos');
      }
    } catch (e) {
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar los estacionamientos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reservar Estacionamiento'),
          backgroundColor: Color(0xFF003DA6),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ParkingLayout(estacionamientos: estacionamientos),
        ),
      ),
    );
  }
}

class ParkingLayout extends StatelessWidget {
  final List<EspacioEstacionamiento> estacionamientos;

  ParkingLayout({required this.estacionamientos});

  List<ParkingSpot> parkingSpots = [
    ParkingSpot(id: 'spot1', top: 20, left: 60, estado: ''),
    ParkingSpot(id: 'spot2', top: 60, left: 60, estado: ''),
    ParkingSpot(id: 'spot3', top: 100, left: 60, estado: ''),
    ParkingSpot(id: 'spot4', top: 140, left: 60, estado: ''),
    ParkingSpot(id: 'spot5', top: 20, left: 180, estado: ''),
    ParkingSpot(id: 'spot6', top: 60, left: 180, estado: ''),
    ParkingSpot(id: 'spot7', top: 100, left: 180, estado: ''),
    ParkingSpot(id: 'spot8', top: 140, left: 180, estado: ''),
    ParkingSpot(id: 'spot9', top: 380, left: 300, estado: ''),
    ParkingSpot(id: 'spot10', top: 380, left: 340, estado: ''),
    ParkingSpot(id: 'spot11', top: 380, left: 380, estado: ''),
    ParkingSpot(id: 'spot12', top: 380, left: 420, estado: ''),
    ParkingSpot(id: 'spot13', top: 380, left: 460, estado: ''),
    ParkingSpot(id: 'spot14', top: 380, left: 500, estado: ''),
    ParkingSpot(id: 'spot15', top: 380, left: 540, estado: ''),
    ParkingSpot(id: 'spot16', top: 380, left: 580, estado: ''),
    ParkingSpot(id: 'spot17', top: 380, left: 620, estado: ''),
    ParkingSpot(id: 'spot18', top: 380, left: 660, estado: ''),
    ParkingSpot(id: 'spot19', top: 380, left: 700, estado: ''),
    ParkingSpot(id: 'spot20', top: 380, left: 740, estado: ''),
    ParkingSpot(id: 'spot21', top: 380, left: 780, estado: ''),
    ParkingSpot(id: 'spot22', top: 475, left: 300, estado: ''),
    ParkingSpot(id: 'spot23', top: 475, left: 340, estado: ''),
    ParkingSpot(id: 'spot24', top: 475, left: 380, estado: ''),
    ParkingSpot(id: 'spot25', top: 475, left: 420, estado: ''),
    ParkingSpot(id: 'spot26', top: 475, left: 460, estado: ''),
    ParkingSpot(id: 'spot27', top: 475, left: 500, estado: ''),
    ParkingSpot(id: 'spot28', top: 475, left: 540, estado: ''),
    ParkingSpot(id: 'spot29', top: 475, left: 580, estado: ''),
    ParkingSpot(id: 'spot30', top: 475, left: 620, estado: ''),
    ParkingSpot(id: 'spot31', top: 475, left: 660, estado: ''),
    ParkingSpot(id: 'spot32', top: 475, left: 700, estado: ''),
    ParkingSpot(id: 'spot33', top: 475, left: 740, estado: ''),
    ParkingSpot(id: 'spot34', top: 475, left: 780, estado: ''),
    ParkingSpot(id: 'spot35', top: 380, left: 860, estado: ''),
    ParkingSpot(id: 'spot36', top: 380, left: 900, estado: ''),
    ParkingSpot(id: 'spot37', top: 380, left: 940, estado: ''),
    ParkingSpot(id: 'spot38', top: 380, left: 980, estado: ''),
    ParkingSpot(id: 'spot39', top: 380, left: 1020, estado: ''),
    ParkingSpot(id: 'spot40', top: 380, left: 1060, estado: ''),
    ParkingSpot(id: 'spot41', top: 380, left: 1100, estado: ''),
    ParkingSpot(id: 'spot42', top: 380, left: 1140, estado: ''),
    ParkingSpot(id: 'spot43', top: 380, left: 1180, estado: ''),
    ParkingSpot(id: 'spot44', top: 475, left: 860, estado: ''),
    ParkingSpot(id: 'spot45', top: 475, left: 900, estado: ''),
    ParkingSpot(id: 'spot46', top: 475, left: 940, estado: ''),
    ParkingSpot(id: 'spot47', top: 475, left: 980, estado: ''),
    ParkingSpot(id: 'spot48', top: 475, left: 1020, estado: ''),
    ParkingSpot(id: 'spot49', top: 475, left: 1060, estado: ''),
    ParkingSpot(id: 'spot50', top: 475, left: 1100, estado: ''),
    ParkingSpot(id: 'spot51', top: 475, left: 1140, estado: ''),
    ParkingSpot(id: 'spot52', top: 475, left: 1180, estado: ''),
    ParkingSpot(id: 'spot53', top: 380, left: 1280, estado: ''),
    ParkingSpot(id: 'spot54', top: 380, left: 1320, estado: ''),
    ParkingSpot(id: 'spot55', top: 380, left: 1360, estado: ''),
    ParkingSpot(id: 'spot56', top: 380, left: 1400, estado: ''),
    ParkingSpot(id: 'spot57', top: 475, left: 1280, estado: ''),
    ParkingSpot(id: 'spot58', top: 475, left: 1320, estado: ''),
    ParkingSpot(id: 'spot59', top: 475, left: 1360, estado: ''),
    ParkingSpot(id: 'spot60', top: 475, left: 1400, estado: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1600, // Ajustar según el número de espacios de estacionamiento
      height: 600,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ...estacionamientos.map((espacio) {
            // Buscar el ParkingSpot correspondiente en parkingSpots por id
            ParkingSpot? matchingSpot = parkingSpots.firstWhere(
              (spot) => spot.id == 'spot'+espacio.idEspacio,
              orElse: () => ParkingSpot(id: espacio.idEspacio, top: espacio.top, left: espacio.left, estado: espacio.estado,),
            );

            return ParkingSpot(
              id: espacio.idEspacio,
              top: matchingSpot.top,
              left: matchingSpot.left,
              estado: espacio.estado,
            );
          }).toList(),
          DisabledSpot(
            id: 'Aulas Virtuales',
            top: 20,
            left: 460,
            width: 420,
            height: 200,
          ),
          DisabledSpot(
            id: 'Semda',
            top: 40,
            left: 910,
            width: 230,
            height: 170,
            rotation: -10,
          ),
          DisabledSpot(
            id: 'ITR',
            top: 100,
            left: 1400,
            width: 150,
            height: 200,
            rotation: -30,
          ),
          DisabledSpot(
            id: 'Auditorio',
            top: 10,
            left: 1150,
            width: 200,
            height: 100,
            rotation: -10,
          ),
          DisabledSpot(
            id: 'Dep. Pedagogía',
            top: 20,
            left: 270,
            width: 130,
            height: 160,
          ),
          DisabledSpot(
            id: '',
            top: 420,
            left: 30,
            width: 1400,
            height: 50,
            color: Colors.white,
          ),
          DisabledSpot(
            id: '',
            top: 20,
            left: 100,
            width: 70,
            height: 400,
            color: Colors.white,
          ),
          DisabledSpot(
            id: '',
            top: 450,
            left: 30,
            width: 70,
            height: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}


class ParkingSpot extends StatelessWidget {
  final String id;
  final double top;
  final double left;
  final String estado; // Estado del estacionamiento

  ParkingSpot({
    required this.id,
    required this.top,
    required this.left,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    Color spotColor = estado == 'Disponible'
        ? Colors.blue.withOpacity(0.3)
        : Colors.red.withOpacity(0.3);
    Color borderColor = estado == 'Disponible' ? Colors.blue : Colors.red;

    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () => mostrarDialogo(context, id),
        child: Stack(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: spotColor,
                border: Border.all(color: borderColor),
              ),
            ),
            Center(
              child: Text(
                id,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarDialogo(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reservar estacionamiento'),
          content: Text('¿Deseas reservar el estacionamiento $id?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirmar'),
              onPressed: () {
                final espacioSeleccionado = id;
                print('Espacio seleccionado: $espacioSeleccionado');
                Navigator.pop(context); // Cerrar el AlertDialog
                Navigator.pop(context, espacioSeleccionado);
              },
            ),
          ],
        );
      },
    );
  }
}

class DisabledSpot extends StatelessWidget {
  final String id;
  final double top;
  final double left;
  final double width;
  final double height;
  final Color color;
  final double rotation;

  DisabledSpot({
    required this.id,
    required this.top,
    required this.left,
    required this.width,
    required this.height,
    this.color = Colors.grey,
    this.rotation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: rotation * (3.14 / 180),
        child: Container(
          width: width,
          height: height,
          color: color,
          child: Center(
            child: Text(
              id,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
