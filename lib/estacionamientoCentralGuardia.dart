// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:pum/reporteGuardia.dart';

class EstacionamientoCentralGuardia extends StatelessWidget {
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
      width: 1600, // Adjust width based on the number of parking spots
      height: 600,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ParkingSpot(id: 'spot1', top: 410, left: 20),
          ParkingSpot(id: 'spot2', top: 410, left: 60),
          ParkingSpot(id: 'spot3', top: 410, left: 100),
          ParkingSpot(id: 'spot4', top: 410, left: 140),
          ParkingSpot(id: 'spot5', top: 410, left: 180),
          ParkingSpot(id: 'spot6', top: 410, left: 220),
          ParkingSpot(id: 'spot7', top: 410, left: 260),
          ParkingSpot(id: 'spot8', top: 410, left: 300),
          ParkingSpot(id: 'spot9', top: 410, left: 340),
          ParkingSpot(id: 'spot10', top: 410, left: 380),
          ParkingSpot(id: 'spot11', top: 410, left: 420),
          ParkingSpot(id: 'spot12', top: 410, left: 460),
          ParkingSpot(id: 'spot13', top: 410, left: 500),
          ParkingSpot(id: 'spot14', top: 290, left: 20),
          ParkingSpot(id: 'spot15', top: 290, left: 60),
          ParkingSpot(id: 'spot16', top: 290, left: 100),
          ParkingSpot(id: 'spot17', top: 290, left: 140),
          ParkingSpot(id: 'spot18', top: 290, left: 180),
          ParkingSpot(id: 'spot19', top: 290, left: 220),
          ParkingSpot(id: 'spot20', top: 290, left: 260),
          ParkingSpot(id: 'spot21', top: 290, left: 300),
          ParkingSpot(id: 'spot22', top: 290, left: 340),
          ParkingSpot(id: 'spot23', top: 290, left: 380),
          ParkingSpot(id: 'spot24', top: 290, left: 420),
          ParkingSpot(id: 'spot25', top: 290, left: 460),
          ParkingSpot(id: 'spot26', top: 290, left: 500),
          ParkingSpot(id: 'spot27', top: 410, left: 840),
          ParkingSpot(id: 'spot28', top: 410, left: 880),
          ParkingSpot(id: 'spot29', top: 410, left: 920),
          ParkingSpot(id: 'spot30', top: 410, left: 960),
          ParkingSpot(id: 'spot31', top: 410, left: 1000),
          ParkingSpot(id: 'spot32', top: 410, left: 1040),
          ParkingSpot(id: 'spot33', top: 410, left: 1080),
          ParkingSpot(id: 'spot34', top: 410, left: 1120),
          ParkingSpot(id: 'spot35', top: 290, left: 840),
          ParkingSpot(id: 'spot36', top: 290, left: 880),
          ParkingSpot(id: 'spot37', top: 290, left: 920),
          ParkingSpot(id: 'spot38', top: 290, left: 960),
          ParkingSpot(id: 'spot39', top: 290, left: 1000),
          ParkingSpot(id: 'spot40', top: 290, left: 1040),
          ParkingSpot(id: 'spot41', top: 290, left: 1080),
          ParkingSpot(id: 'spot42', top: 290, left: 1120),
          ParkingSpot(id: 'spot43', top: 290, left: 1160),
          ParkingSpot(id: 'spot44', top: 290, left: 1200),
          ParkingSpot(id: 'spot45', top: 290, left: 1240),
          ParkingSpot(id: 'spot46', top: 290, left: 1280),
          ParkingSpot(id: 'spot47', top: 290, left: 1320),
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
                  print('Modificar presionado!');
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
                    MaterialPageRoute(builder: (context) => ReportesGuardia(idEspacio: id,Edificio:'Central')),
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
