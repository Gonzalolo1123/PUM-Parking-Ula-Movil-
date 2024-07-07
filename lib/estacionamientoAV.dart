// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';

class EstacionamientoAV extends StatelessWidget {
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
      width: 1600, // Adjust width based on the number of parking spots
      height: 600,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ParkingSpot(id: 'spot1', top: 20, left: 60),
          ParkingSpot(id: 'spot2', top: 60, left: 60),
          ParkingSpot(id: 'spot3', top: 100, left: 60),
          ParkingSpot(id: 'spot4', top: 140, left: 60),
          ParkingSpot(id: 'spot5', top: 20, left: 180),
          ParkingSpot(id: 'spot6', top: 60, left: 180),
          ParkingSpot(id: 'spot7', top: 100, left: 180),
          ParkingSpot(id: 'spot8', top: 140, left: 180),
          ParkingSpot(id: 'spot9', top: 380, left: 300),
          ParkingSpot(id: 'spot10', top: 380, left: 340),
          ParkingSpot(id: 'spot11', top: 380, left: 380),
          ParkingSpot(id: 'spot12', top: 380, left: 420),
          ParkingSpot(id: 'spot13', top: 380, left: 460),
          ParkingSpot(id: 'spot14', top: 380, left: 500),
          ParkingSpot(id: 'spot15', top: 380, left: 540),
          ParkingSpot(id: 'spot16', top: 380, left: 580),
          ParkingSpot(id: 'spot17', top: 380, left: 620),
          ParkingSpot(id: 'spot18', top: 380, left: 660),
          ParkingSpot(id: 'spot19', top: 380, left: 700),
          ParkingSpot(id: 'spot20', top: 380, left: 740),
          ParkingSpot(id: 'spot21', top: 380, left: 780),
          ParkingSpot(id: 'spot22', top: 475, left: 300),
          ParkingSpot(id: 'spot23', top: 475, left: 340),
          ParkingSpot(id: 'spot24', top: 475, left: 380),
          ParkingSpot(id: 'spot25', top: 475, left: 420),
          ParkingSpot(id: 'spot26', top: 475, left: 460),
          ParkingSpot(id: 'spot27', top: 475, left: 500),
          ParkingSpot(id: 'spot28', top: 475, left: 540),
          ParkingSpot(id: 'spot29', top: 475, left: 580),
          ParkingSpot(id: 'spot30', top: 475, left: 620),
          ParkingSpot(id: 'spot31', top: 475, left: 660),
          ParkingSpot(id: 'spot32', top: 475, left: 700),
          ParkingSpot(id: 'spot33', top: 475, left: 740),
          ParkingSpot(id: 'spot34', top: 475, left: 780),
          ParkingSpot(id: 'spot35', top: 380, left: 860),
          ParkingSpot(id: 'spot36', top: 380, left: 900),
          ParkingSpot(id: 'spot37', top: 380, left: 940),
          ParkingSpot(id: 'spot38', top: 380, left: 980),
          ParkingSpot(id: 'spot39', top: 380, left: 1020),
          ParkingSpot(id: 'spot40', top: 380, left: 1060),
          ParkingSpot(id: 'spot41', top: 380, left: 1100),
          ParkingSpot(id: 'spot42', top: 380, left: 1140),
          ParkingSpot(id: 'spot43', top: 380, left: 1180),
          ParkingSpot(id: 'spot44', top: 475, left: 860),
          ParkingSpot(id: 'spot45', top: 475, left: 900),
          ParkingSpot(id: 'spot46', top: 475, left: 940),
          ParkingSpot(id: 'spot47', top: 475, left: 980),
          ParkingSpot(id: 'spot48', top: 475, left: 1020),
          ParkingSpot(id: 'spot49', top: 475, left: 1060),
          ParkingSpot(id: 'spot50', top: 475, left: 1100),
          ParkingSpot(id: 'spot51', top: 475, left: 1140),
          ParkingSpot(id: 'spot52', top: 475, left: 1180),
          ParkingSpot(id: 'spot53', top: 380, left: 1280),
          ParkingSpot(id: 'spot54', top: 380, left: 1320),
          ParkingSpot(id: 'spot55', top: 380, left: 1360),
          ParkingSpot(id: 'spot56', top: 380, left: 1400),
          ParkingSpot(id: 'spot57', top: 475, left: 1280),
          ParkingSpot(id: 'spot58', top: 475, left: 1320),
          ParkingSpot(id: 'spot59', top: 475, left: 1360),
          ParkingSpot(id: 'spot60', top: 475, left: 1400),
          DisabledSpot(
              id: 'Aulas Virtuales',
              top: 20,
              left: 460,
              width: 420,
              height: 200),
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
              rotation: -30),
          DisabledSpot(
            id: 'Auditorio',
            top: 10,
            left: 1150,
            width: 200,
            height: 100,
            rotation: -10,
          ),
          DisabledSpot(
              id: 'Dep. Pedagodia',
              top: 20,
              left: 270,
              width: 130,
              height: 160),
          DisabledSpot(
              id: '',
              top: 420,
              left: 30,
              width: 1400,
              height: 50,
              color: Colors.white),
          DisabledSpot(
              id: '',
              top: 20,
              left: 100,
              width: 70,
              height: 400,
              color: Colors.white),
          DisabledSpot(
              id: '',
              top: 450,
              left: 30,
              width: 70,
              height: 100,
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
              width: 30,
              height: 30,
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

void main() => runApp(EstacionamientoAV());
