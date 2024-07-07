// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pum/reporteGuardia.dart';

class EstacionamientoCentralGuardia extends StatelessWidget {
  String? usuarioId;
  EstacionamientoCentralGuardia(this.usuarioId);

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
          child: ParkingLayout(usuarioId),
        ),
      ),
    );
  }
}

class ParkingLayout extends StatelessWidget {
  String? usuarioId;

  ParkingLayout(this.usuarioId);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1600, // Adjust width based on the number of parking spots
      height: 600,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ParkingSpot(id: 'spot61', top: 410, left: 20, usuarioId: usuarioId),
          ParkingSpot(id: 'spot62', top: 410, left: 60, usuarioId: usuarioId),
          ParkingSpot(id: 'spot63', top: 410, left: 100, usuarioId: usuarioId),
          ParkingSpot(id: 'spot64', top: 410, left: 140, usuarioId: usuarioId),
          ParkingSpot(id: 'spot65', top: 410, left: 180, usuarioId: usuarioId),
          ParkingSpot(id: 'spot66', top: 410, left: 220, usuarioId: usuarioId),
          ParkingSpot(id: 'spot67', top: 410, left: 260, usuarioId: usuarioId),
          ParkingSpot(id: 'spot68', top: 410, left: 300, usuarioId: usuarioId),
          ParkingSpot(id: 'spot69', top: 410, left: 340, usuarioId: usuarioId),
          ParkingSpot(id: 'spot70', top: 410, left: 380, usuarioId: usuarioId),
          ParkingSpot(id: 'spot71', top: 410, left: 420, usuarioId: usuarioId),
          ParkingSpot(id: 'spot72', top: 410, left: 460, usuarioId: usuarioId),
          ParkingSpot(id: 'spot73', top: 410, left: 500, usuarioId: usuarioId),
          ParkingSpot(id: 'spot74', top: 290, left: 20, usuarioId: usuarioId),
          ParkingSpot(id: 'spot75', top: 290, left: 60, usuarioId: usuarioId),
          ParkingSpot(id: 'spot76', top: 290, left: 100, usuarioId: usuarioId),
          ParkingSpot(id: 'spot77', top: 290, left: 140, usuarioId: usuarioId),
          ParkingSpot(id: 'spot78', top: 290, left: 180, usuarioId: usuarioId),
          ParkingSpot(id: 'spot79', top: 290, left: 220, usuarioId: usuarioId),
          ParkingSpot(id: 'spot80', top: 290, left: 260, usuarioId: usuarioId),
          ParkingSpot(id: 'spot81', top: 290, left: 300, usuarioId: usuarioId),
          ParkingSpot(id: 'spot82', top: 290, left: 340, usuarioId: usuarioId),
          ParkingSpot(id: 'spot83', top: 290, left: 380, usuarioId: usuarioId),
          ParkingSpot(id: 'spot84', top: 290, left: 420, usuarioId: usuarioId),
          ParkingSpot(id: 'spot85', top: 290, left: 460, usuarioId: usuarioId),
          ParkingSpot(id: 'spot86', top: 290, left: 500, usuarioId: usuarioId),
          ParkingSpot(id: 'spot87', top: 410, left: 840, usuarioId: usuarioId),
          ParkingSpot(id: 'spot88', top: 410, left: 880, usuarioId: usuarioId),
          ParkingSpot(id: 'spot89', top: 410, left: 920, usuarioId: usuarioId),
          ParkingSpot(id: 'spot90', top: 410, left: 960, usuarioId: usuarioId),
          ParkingSpot(id: 'spot91', top: 410, left: 1000, usuarioId: usuarioId),
          ParkingSpot(id: 'spot92', top: 410, left: 1040, usuarioId: usuarioId),
          ParkingSpot(id: 'spot93', top: 410, left: 1080, usuarioId: usuarioId),
          ParkingSpot(id: 'spot94', top: 410, left: 1120, usuarioId: usuarioId),
          ParkingSpot(id: 'spot95', top: 290, left: 840, usuarioId: usuarioId),
          ParkingSpot(id: 'spot96', top: 290, left: 880, usuarioId: usuarioId),
          ParkingSpot(id: 'spot97', top: 290, left: 920, usuarioId: usuarioId),
          ParkingSpot(id: 'spot98', top: 290, left: 960, usuarioId: usuarioId),
          ParkingSpot(id: 'spot99', top: 290, left: 1000, usuarioId: usuarioId),
          ParkingSpot(id: 'spot100', top: 290, left: 1040, usuarioId: usuarioId),
          ParkingSpot(id: 'spot101', top: 290, left: 1080, usuarioId: usuarioId),
          ParkingSpot(id: 'spot102', top: 290, left: 1120, usuarioId: usuarioId),
          ParkingSpot(id: 'spot103', top: 290, left: 1160, usuarioId: usuarioId),
          ParkingSpot(id: 'spot104', top: 290, left: 1200, usuarioId: usuarioId),
          ParkingSpot(id: 'spot105', top: 290, left: 1240, usuarioId: usuarioId),
          ParkingSpot(id: 'spot106', top: 290, left: 1280, usuarioId: usuarioId),
          ParkingSpot(id: 'spot107', top: 290, left: 1320, usuarioId: usuarioId),
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
  final String? usuarioId;

  ParkingSpot({required this.id, required this.top, required this.left,this.usuarioId});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () => mostrarDialogo(context, id.substring(4),usuarioId),
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

  void mostrarDialogo(BuildContext context, String id, [String? usuarioId]) {
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
                              idEspacio: id,
                              Edificio: 'Central',
                            )),
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
                              idEspacio: id,
                              Edificio: 'Central',
                              usuarioId: usuarioId,
                              
                            )),
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
