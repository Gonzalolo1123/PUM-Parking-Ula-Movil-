// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';

class EstacionamientoCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reservar Estacionamiento'),
          backgroundColor: Color(0xFF003DA6),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 1500,
            height: 500,
            color: Color(0xFFE0E0E0),
            child: Stack(
              children: [
                ParkingSpot(id: 'spot61', top: 410, left: 20),
                ParkingSpot(id: 'spot62', top: 410, left: 60),
                ParkingSpot(id: 'spot63', top: 410, left: 100),
                ParkingSpot(id: 'spot64', top: 410, left: 140),
                ParkingSpot(id: 'spot65', top: 410, left: 180),
                ParkingSpot(id: 'spot66', top: 410, left: 220),
                ParkingSpot(id: 'spot67', top: 410, left: 260),
                ParkingSpot(id: 'spot68', top: 410, left: 300),
                ParkingSpot(id: 'spot69', top: 410, left: 340),
                ParkingSpot(id: 'spot70', top: 410, left: 380),
                ParkingSpot(id: 'spot71', top: 410, left: 420),
                ParkingSpot(id: 'spot72', top: 410, left: 460),
                ParkingSpot(id: 'spot73', top: 410, left: 500),
                ParkingSpot(id: 'spot74', top: 290, left: 20),
                ParkingSpot(id: 'spot75', top: 290, left: 60),
                ParkingSpot(id: 'spot76', top: 290, left: 100),
                ParkingSpot(id: 'spot77', top: 290, left: 140),
                ParkingSpot(id: 'spot78', top: 290, left: 180),
                ParkingSpot(id: 'spot79', top: 290, left: 220),
                ParkingSpot(id: 'spot80', top: 290, left: 260),
                ParkingSpot(id: 'spot81', top: 290, left: 300),
                ParkingSpot(id: 'spot82', top: 290, left: 340),
                ParkingSpot(id: 'spot83', top: 290, left: 380),
                ParkingSpot(id: 'spot84', top: 290, left: 420),
                ParkingSpot(id: 'spot85', top: 290, left: 460),
                ParkingSpot(id: 'spot86', top: 290, left: 500),
                ParkingSpot(id: 'spot87', top: 410, left: 840),
                ParkingSpot(id: 'spot88', top: 410, left: 880),
                ParkingSpot(id: 'spot89', top: 410, left: 920),
                ParkingSpot(id: 'spot90', top: 410, left: 960),
                ParkingSpot(id: 'spot91', top: 410, left: 1000),
                ParkingSpot(id: 'spot92', top: 410, left: 1040),
                ParkingSpot(id: 'spot93', top: 410, left: 1080),
                ParkingSpot(id: 'spot94', top: 410, left: 1120),
                ParkingSpot(id: 'spot95', top: 290, left: 840),
                ParkingSpot(id: 'spot96', top: 290, left: 880),
                ParkingSpot(id: 'spot97', top: 290, left: 920),
                ParkingSpot(id: 'spot98', top: 290, left: 960),
                ParkingSpot(id: 'spot99', top: 290, left: 1000),
                ParkingSpot(id: 'spot100', top: 290, left: 1040),
                ParkingSpot(id: 'spot101', top: 290, left: 1080),
                ParkingSpot(id: 'spot102', top: 290, left: 1120),
                ParkingSpot(id: 'spot103', top: 290, left: 1160),
                ParkingSpot(id: 'spot104', top: 290, left: 1200),
                ParkingSpot(id: 'spot105', top: 290, left: 1240),
                ParkingSpot(id: 'spot106', top: 290, left: 1280),
                ParkingSpot(id: 'spot107', top: 290, left: 1320),
                DisabledSpot(
                    id: 'Pasillo E',
                    top: 40,
                    left: 30,
                    width: 400,
                    height: 220),
                DisabledSpot(
                    id: 'Central', top: 40, left: 450, width: 490, height: 220),
                DisabledSpot(
                    id: 'Biblioteca',
                    top: 40,
                    left: 970,
                    width: 400,
                    height: 220),
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
          ),
        ),
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
          title: Text('Reservar Estacionamiento'),
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
