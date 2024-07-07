// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class EstacionamientoMeyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reservar EstacionamientoMeyer'),
          backgroundColor: Color(0xFF003DA6),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ParkingLayout(),
        ),
      ),
    );
  }
}

class ParkingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          1400, // Ajusta según la cantidad de espacios de estacionamientoMeyer
      height: 500,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ParkingSpot(
            id: 'spot108',
            top: 430,
            left: 40,
          ),
          ParkingSpot(id: 'spot109', top: 430, left: 100),
          ParkingSpot(id: 'spot110', top: 430, left: 160),
          ParkingSpot(id: 'spot111', top: 430, left: 220),
          ParkingSpot(id: 'spot112', top: 430, left: 280),
          ParkingSpot(id: 'spot113', top: 430, left: 340),
          ParkingSpot(id: 'spot114', top: 430, left: 400),
          ParkingSpot(id: 'spot115', top: 430, left: 460),
          ParkingSpot(id: 'spot116', top: 290, left: 40),
          ParkingSpot(id: 'spot117', top: 290, left: 100),
          ParkingSpot(id: 'spot118', top: 290, left: 160),
          ParkingSpot(id: 'spot119', top: 290, left: 220),
          ParkingSpot(id: 'spot120', top: 290, left: 280),
          ParkingSpot(id: 'spot121', top: 290, left: 340),
          ParkingSpot(id: 'spot122', top: 290, left: 400),
          ParkingSpot(id: 'spot123', top: 290, left: 460),
          ParkingSpot(id: 'spot124', top: 430, left: 860),
          ParkingSpot(id: 'spot125', top: 430, left: 920),
          ParkingSpot(id: 'spot126', top: 430, left: 980),
          ParkingSpot(id: 'spot127', top: 430, left: 1040),
          ParkingSpot(id: 'spot128', top: 430, left: 1100),
          ParkingSpot(id: 'spot129', top: 430, left: 1160),
          ParkingSpot(id: 'spot130', top: 430, left: 1220),
          ParkingSpot(id: 'spot131', top: 430, left: 1280),
          ParkingSpot(id: 'spot132', top: 290, left: 860),
          ParkingSpot(id: 'spot133', top: 290, left: 920),
          ParkingSpot(id: 'spot134', top: 290, left: 980),
          ParkingSpot(id: 'spot135', top: 290, left: 1040),
          ParkingSpot(id: 'spot136', top: 290, left: 1100),
          ParkingSpot(id: 'spot137', top: 290, left: 1160),
          ParkingSpot(id: 'spot138', top: 290, left: 1220),
          ParkingSpot(id: 'spot139', top: 290, left: 1280),
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

  ParkingSpot({required this.id, required this.top, required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () => mostrarDialogo(context, id.substring(4)),
        child: Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                border: Border.all(color: Colors.blue),
              ),
            ),
            Center(
              child: Text(
                id.substring(4),
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
