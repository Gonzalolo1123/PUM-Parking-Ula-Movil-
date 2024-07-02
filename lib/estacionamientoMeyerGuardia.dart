// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class EstacionamientoMeyerGuardia extends StatelessWidget {
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
          1400, // Ajusta según la cantidad de espacios de estacionamientoMeyerGuardia
      height: 500,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ParkingSpot(
            id: 'spot1',
            top: 430,
            left: 40,
          ),
          ParkingSpot(id: 'spot2', top: 430, left: 100),
          ParkingSpot(id: 'spot3', top: 430, left: 160),
          ParkingSpot(id: 'spot4', top: 430, left: 220),
          ParkingSpot(id: 'spot5', top: 430, left: 280),
          ParkingSpot(id: 'spot6', top: 430, left: 340),
          ParkingSpot(id: 'spot7', top: 430, left: 400),
          ParkingSpot(id: 'spot8', top: 430, left: 460),
          ParkingSpot(id: 'spot9', top: 290, left: 40),
          ParkingSpot(id: 'spot10', top: 290, left: 100),
          ParkingSpot(id: 'spot11', top: 290, left: 160),
          ParkingSpot(id: 'spot12', top: 290, left: 220),
          ParkingSpot(id: 'spot13', top: 290, left: 280),
          ParkingSpot(id: 'spot14', top: 290, left: 340),
          ParkingSpot(id: 'spot15', top: 290, left: 400),
          ParkingSpot(id: 'spot16', top: 290, left: 460),
          ParkingSpot(id: 'spot17', top: 430, left: 860),
          ParkingSpot(id: 'spot18', top: 430, left: 920),
          ParkingSpot(id: 'spot19', top: 430, left: 980),
          ParkingSpot(id: 'spot20', top: 430, left: 1040),
          ParkingSpot(id: 'spot21', top: 430, left: 1100),
          ParkingSpot(id: 'spot22', top: 430, left: 1160),
          ParkingSpot(id: 'spot23', top: 430, left: 1220),
          ParkingSpot(id: 'spot24', top: 430, left: 1280),
          ParkingSpot(id: 'spot25', top: 290, left: 860),
          ParkingSpot(id: 'spot26', top: 290, left: 920),
          ParkingSpot(id: 'spot27', top: 290, left: 980),
          ParkingSpot(id: 'spot28', top: 290, left: 1040),
          ParkingSpot(id: 'spot29', top: 290, left: 1100),
          ParkingSpot(id: 'spot30', top: 290, left: 1160),
          ParkingSpot(id: 'spot31', top: 290, left: 1220),
          ParkingSpot(id: 'spot32', top: 290, left: 1280),
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
          title: Text('Reservar estacionamientoMeyerGuardia'),
          content: Text('¿Deseas reservar el estacionamientoMeyerGuardia $id?'),
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
