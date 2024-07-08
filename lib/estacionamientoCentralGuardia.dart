// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, use_build_context_synchronously, avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, unnecessary_to_list_in_spreads

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'reporteGuardia.dart';

class EspacioEstacionamientoCentralGuardiaGuardia {
  final String idEspacio;
  final double top;
  final double left;
  final String estado;

  EspacioEstacionamientoCentralGuardiaGuardia({
    required this.idEspacio,
    required this.top,
    required this.left,
    required this.estado,
  });

  factory EspacioEstacionamientoCentralGuardiaGuardia.fromJson(
      Map<String, dynamic> json) {
    return EspacioEstacionamientoCentralGuardiaGuardia(
      idEspacio: json['id_espacio'].toString(),
      top: json['top']?.toDouble() ?? 0.0,
      left: json['left']?.toDouble() ?? 0.0,
      estado: json['estado'].toString(),
    );
  }
}

class EstacionamientoCentralGuardia extends StatefulWidget {
  @override
  _EstacionamientoAVState createState() => _EstacionamientoAVState();
}

class _EstacionamientoAVState extends State<EstacionamientoCentralGuardia> {
  List<EspacioEstacionamientoCentralGuardiaGuardia> estacionamientos = [];

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
              .map((item) =>
                  EspacioEstacionamientoCentralGuardiaGuardia.fromJson(item))
              .where((estacionamiento) =>
                  int.tryParse(estacionamiento.idEspacio) != null &&
                  int.parse(estacionamiento.idEspacio) >= 61 &&
                  int.parse(estacionamiento.idEspacio) <= 107)
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
                'Seguimiento Central Guardia',
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
  final List<EspacioEstacionamientoCentralGuardiaGuardia> estacionamientos;

  ParkingLayout({required this.estacionamientos});

  List<ParkingSpot> parkingSpots = [
    ParkingSpot(
      id: 'spot61',
      top: 410,
      left: 20,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot62',
      top: 410,
      left: 60,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot63',
      top: 410,
      left: 100,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot64',
      top: 410,
      left: 140,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot65',
      top: 410,
      left: 180,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot66',
      top: 410,
      left: 220,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot67',
      top: 410,
      left: 260,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot68',
      top: 410,
      left: 300,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot69',
      top: 410,
      left: 340,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot70',
      top: 410,
      left: 380,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot71',
      top: 410,
      left: 420,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot72',
      top: 410,
      left: 460,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot73',
      top: 410,
      left: 500,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot74',
      top: 290,
      left: 20,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot75',
      top: 290,
      left: 60,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot76',
      top: 290,
      left: 100,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot77',
      top: 290,
      left: 140,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot78',
      top: 290,
      left: 180,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot79',
      top: 290,
      left: 220,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot80',
      top: 290,
      left: 260,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot81',
      top: 290,
      left: 300,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot82',
      top: 290,
      left: 340,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot83',
      top: 290,
      left: 380,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot84',
      top: 290,
      left: 420,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot85',
      top: 290,
      left: 460,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot86',
      top: 290,
      left: 500,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot87',
      top: 410,
      left: 840,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot88',
      top: 410,
      left: 880,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot89',
      top: 410,
      left: 920,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot90',
      top: 410,
      left: 960,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot91',
      top: 410,
      left: 1000,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot92',
      top: 410,
      left: 1040,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot93',
      top: 410,
      left: 1080,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot94',
      top: 410,
      left: 1120,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot95',
      top: 290,
      left: 840,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot96',
      top: 290,
      left: 880,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot97',
      top: 290,
      left: 920,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot98',
      top: 290,
      left: 960,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot99',
      top: 290,
      left: 1000,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot100',
      top: 290,
      left: 1040,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot101',
      top: 290,
      left: 1080,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot102',
      top: 290,
      left: 1120,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot103',
      top: 290,
      left: 1160,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot104',
      top: 290,
      left: 1200,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot105',
      top: 290,
      left: 1240,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot106',
      top: 290,
      left: 1280,
      estado: '',
    ),
    ParkingSpot(
      id: 'spot107',
      top: 290,
      left: 1320,
      estado: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1500, // Ajustar según el número de espacios de estacionamiento
      height: 600,
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
              id: 'Pasillo E', top: 40, left: 30, width: 400, height: 220),
          DisabledSpot(
              id: 'Central', top: 40, left: 450, width: 490, height: 220),
          DisabledSpot(
              id: 'Biblioteca', top: 40, left: 970, width: 400, height: 220),
          DisabledSpot(
              id: '',
              top: 330,
              left: 10,
              width: 1410,
              height: 70,
              color: Colors.white),
          DisabledSpot(
              id: '',
              top: 400,
              left: 570,
              width: 230,
              height: 150,
              color: Colors.white),
          DisabledSpot(
              id: '',
              top: 430,
              left: 1050,
              width: 400,
              height: 70,
              rotation: -30,
              color: Colors.white),
          DisabledSpot(
              id: '',
              top: 40,
              left: 1410,
              width: 60,
              height: 640,
              color: Colors.white),
          DisabledSpot(
              id: '',
              top: 200,
              left: 1050,
              width: 100,
              height: 700,
              rotation: -80,
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
          title: Text('Reporte Estacionamiento'),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20), // Ajustar el padding de todo el contenido
          content: Column(
            mainAxisSize: MainAxisSize.min, // Ajustar tamaño según contenido
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 1.0),
              const Text(
                '¿Qué desea hacer?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              const SizedBox(height: 20),
              Text(
                'Estacionamiento $id',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              const SizedBox(height: 20.0),
              TextButton.icon(
                onPressed: () {
                  // Lógica para el botón
                  print('Ingresar presionado!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IngresarReservaGuardia(
                            idEspacio: id, Edificio: 'Central')),
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(320, 40), // Tamaño mínimo del botón
                  padding:
                      const EdgeInsets.all(10.0), // Padding interno del botón
                  backgroundColor: Colors.white, // Color de fondo del botón
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(100), // Bordes redondeados
                    side: const BorderSide(
                        width: 2, color: Color(0xFF003DA6)), // Borde opcional
                  ),
                ),
                icon: Icon(Icons.directions_car,
                    color: Color(0xFF003DA6)), // Icono de entrada
                label: const Text(
                  'Ingresar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6), // Color del texto del botón
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton.icon(
                onPressed: () {
                  // Lógica para el botón
                  print('Eliminar presionado!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EliminarReservaGuardia(
                            idEspacio: id, Edificio: 'Central')),
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(320, 40), // Tamaño mínimo del botón
                  padding:
                      const EdgeInsets.all(10.0), // Padding interno del botón
                  backgroundColor: Colors.white, // Color de fondo del botón
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(100), // Bordes redondeados
                    side: const BorderSide(
                        width: 2, color: Color(0xFF003DA6)), // Borde opcional
                  ),
                ),
                icon: Icon(Icons.cancel_rounded,
                    color: Color(0xFF003DA6)), // Icono de modificar
                label: const Text(
                  'Eliminar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6), // Color del texto del botón
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton.icon(
                onPressed: () {
                  // Lógica para el botón
                  print('Reporte presionado!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportesGuardia(
                            idEspacio: id, Edificio: 'Central')),
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(320, 40), // Tamaño mínimo del botón
                  padding:
                      const EdgeInsets.all(10.0), // Padding interno del botón
                  backgroundColor: Colors.white, // Color de fondo del botón
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(100), // Bordes redondeados
                    side: const BorderSide(
                        width: 2, color: Color(0xFF003DA6)), // Borde opcional
                  ),
                ),
                icon: Icon(Icons.assignment,
                    color: Color(0xFF003DA6)), // Icono de alerta
                label: const Text(
                  'Reportar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6), // Color del texto del botón
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),

          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Cerrar el AlertDialog sin resultados
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
