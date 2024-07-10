// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, use_build_context_synchronously, avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, unnecessary_to_list_in_spreads

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'reporteGuardia.dart';

class EspacioEstacionamientoMeyerGuardiaGuardia {
  final String idEspacio;
  final double top;
  final double left;
  final String estado;

  EspacioEstacionamientoMeyerGuardiaGuardia({
    required this.idEspacio,
    required this.top,
    required this.left,
    required this.estado,
  });

  factory EspacioEstacionamientoMeyerGuardiaGuardia.fromJson(
      Map<String, dynamic> json) {
    return EspacioEstacionamientoMeyerGuardiaGuardia(
      idEspacio: json['id_espacio'].toString(),
      top: json['top']?.toDouble() ?? 0.0,
      left: json['left']?.toDouble() ?? 0.0,
      estado: json['estado'].toString(),
    );
  }
}

class EstacionamientoMeyerGuardia extends StatefulWidget {
  final String usuarioId;
  EstacionamientoMeyerGuardia(this.usuarioId);
  @override
  _EstacionamientoMeyerGuardiaState createState() =>
      _EstacionamientoMeyerGuardiaState();
}

class _EstacionamientoMeyerGuardiaState
    extends State<EstacionamientoMeyerGuardia> {
  late String _usuarioId;
  List<EspacioEstacionamientoMeyerGuardiaGuardia> estacionamientos = [];

  @override
  void initState() {
    super.initState();
    _cargarEstacionamientos();
    _usuarioId = widget.usuarioId;
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
                  EspacioEstacionamientoMeyerGuardiaGuardia.fromJson(item))
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
                'Seguimiento Meyer Guardia',
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
          child: ParkingLayout(
              estacionamientos: estacionamientos, usuarioId: _usuarioId),
        ),
      ),
    );
  }
}

class ParkingLayout extends StatelessWidget {
  final String usuarioId;
  final List<EspacioEstacionamientoMeyerGuardiaGuardia> estacionamientos;

  ParkingLayout({required this.estacionamientos, required this.usuarioId});

  List<ParkingSpot> parkingSpots = [
    ParkingSpot(id: 'spot108', top: 430, left: 40, estado: '', usuarioId: ''),
    ParkingSpot(
      id: 'spot109',
      top: 430,
      left: 100,
      estado: '', usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot110',
      top: 430,
      left: 160,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot111',
      top: 430,
      left: 220,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot112',
      top: 430,
      left: 280,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot113',
      top: 430,
      left: 340,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot114',
      top: 430,
      left: 400,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot115',
      top: 430,
      left: 460,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot116',
      top: 290,
      left: 40,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot117',
      top: 290,
      left: 100,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot118',
      top: 290,
      left: 160,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot119',
      top: 290,
      left: 220,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot120',
      top: 290,
      left: 280,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot121',
      top: 290,
      left: 340,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot122',
      top: 290,
      left: 400,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot123',
      top: 290,
      left: 460,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot124',
      top: 430,
      left: 860,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot125',
      top: 430,
      left: 920,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot126',
      top: 430,
      left: 980,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot127',
      top: 430,
      left: 1040,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot128',
      top: 430,
      left: 1100,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot129',
      top: 430,
      left: 1160,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot130',
      top: 430,
      left: 1220,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot131',
      top: 430,
      left: 1280,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot132',
      top: 290,
      left: 860,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot133',
      top: 290,
      left: 920,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot134',
      top: 290,
      left: 980,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot135',
      top: 290,
      left: 1040,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot136',
      top: 290,
      left: 1100,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot137',
      top: 290,
      left: 1160,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot138',
      top: 290,
      left: 1220,
      estado: '',usuarioId: '',
    ),
    ParkingSpot(
      id: 'spot139',
      top: 290,
      left: 1280,
      estado: '',usuarioId: '',
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
                estado: espacio.estado, usuarioId: usuarioId,
              ),
            );

            return ParkingSpot(
              id: espacio.idEspacio,
              top: matchingSpot.top,
              left: matchingSpot.left,
              estado: espacio.estado,
              usuarioId: usuarioId,
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
  final String usuarioId;

  ParkingSpot({
    required this.id,
    required this.top,
    required this.left,
    required this.estado,
    required this.usuarioId,
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
                            idEspacio: id, Edificio: 'Central', usuarioId: usuarioId,)),
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
