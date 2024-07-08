// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, use_build_context_synchronously, avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, unnecessary_to_list_in_spreads

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EspacioEstacionamientoMeyer {
  final String idEspacio;
  final double top;
  final double left;
  final String estado;

  EspacioEstacionamientoMeyer({
    required this.idEspacio,
    required this.top,
    required this.left,
    required this.estado,
  });

  factory EspacioEstacionamientoMeyer.fromJson(Map<String, dynamic> json) {
    return EspacioEstacionamientoMeyer(
      idEspacio: json['id_espacio'].toString(),
      top: json['top']?.toDouble() ?? 0.0,
      left: json['left']?.toDouble() ?? 0.0,
      estado: json['estado'].toString(),
    );
  }
}

class EstacionamientoMeyer extends StatefulWidget {
  @override
  _EstacionamientoMeyerState createState() => _EstacionamientoMeyerState();
}

class _EstacionamientoMeyerState extends State<EstacionamientoMeyer> {
  List<EspacioEstacionamientoMeyer> estacionamientos = [];

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
          // Filtrar estacionamientos válidos entre 1 y 60
          estacionamientos = data
              .map((item) => EspacioEstacionamientoMeyer.fromJson(item))
              .where((estacionamiento) =>
                  int.tryParse(estacionamiento.idEspacio) != null &&
                  int.parse(estacionamiento.idEspacio) >= 108 &&
                  int.parse(estacionamiento.idEspacio) <= 139)
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFF003DA6),
            title: Align(
              alignment: Alignment(0.0, 0.8),
              child: Text(
                'Reservar Estacionamiento',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
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
  final List<EspacioEstacionamientoMeyer> estacionamientos;

  ParkingLayout({required this.estacionamientos});

  List<ParkingSpot> parkingSpots = [
    ParkingSpot(
      id: 'spot108',
      top: 430,
      left: 40,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot109',
      top: 430,
      left: 100,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot110',
      top: 430,
      left: 160,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot111',
      top: 430,
      left: 220,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot112',
      top: 430,
      left: 280,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot113',
      top: 430,
      left: 340,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot114',
      top: 430,
      left: 400,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot115',
      top: 430,
      left: 460,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot116',
      top: 290,
      left: 40,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot117',
      top: 290,
      left: 100,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot118',
      top: 290,
      left: 160,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot119',
      top: 290,
      left: 220,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot120',
      top: 290,
      left: 280,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot121',
      top: 290,
      left: 340,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot122',
      top: 290,
      left: 400,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot123',
      top: 290,
      left: 460,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot124',
      top: 430,
      left: 860,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot125',
      top: 430,
      left: 920,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot126',
      top: 430,
      left: 980,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot127',
      top: 430,
      left: 1040,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot128',
      top: 430,
      left: 1100,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot129',
      top: 430,
      left: 1160,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot130',
      top: 430,
      left: 1220,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot131',
      top: 430,
      left: 1280,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot132',
      top: 290,
      left: 860,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot133',
      top: 290,
      left: 920,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot134',
      top: 290,
      left: 980,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot135',
      top: 290,
      left: 1040,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot136',
      top: 290,
      left: 1100,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot137',
      top: 290,
      left: 1160,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot138',
      top: 290,
      left: 1220,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot139',
      top: 290,
      left: 1280,
      estado: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400, // Ajustar según el número de espacios de estacionamiento
      height: 500,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ...estacionamientos.map((espacio) {
            // Buscar el ParkingSpot correspondiente en parkingSpots por id
            ParkingSpot? matchingSpot = parkingSpots.firstWhere(
              (spot) => spot.id == 'spot${espacio.idEspacio}',
              orElse: () => ParkingSpot(
                id: espacio.idEspacio,
                top: espacio.top,
                left: espacio.left,
                estado: espacio.estado,
              ),
            );

            return ParkingSpot(
              id: espacio.idEspacio,
              top: matchingSpot.top,
              left: matchingSpot.left,
              estado: espacio.estado,
            );
          }).toList(),
          DisabledSpot(
              id: 'disabled1', top: 70, left: 120, width: 180, height: 170),
          DisabledSpot(
              id: 'disabled2',
              top: 40,
              left: 350,
              width: 700,
              height: 200,
              label: 'PRINCIPAL'),
          DisabledSpot(
              id: 'disabled3',
              top: 350,
              left: 35,
              width: 1300,
              height: 70,
              color: Colors.white),
          DisabledSpot(
              id: 'disabled4',
              top: 420,
              left: 600,
              width: 180,
              height: 80,
              color: Colors.white),
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
              width: 50,
              height: 50,
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
          title: Text('Reservar estacionamientoMeyer'),
          content: Text('¿Deseas reservar el estacionamientoMeyer $id?'),
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
                final espacioSeleccionado =
                    id; // Aquí el id ya es el espacio seleccionado
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
  final String? label;

  DisabledSpot({
    required this.id,
    required this.top,
    required this.left,
    required this.width,
    required this.height,
    this.color = const Color(0x80808080),
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        height: height,
        color: color,
        child: label != null
            ? Center(
                child: Text(
                  label!,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
