// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pum/reporteGuardia.dart';

class EstacionamientoMeyerGuardia extends StatelessWidget {
  String? usuarioId;
  EstacionamientoMeyerGuardia(this.usuarioId);

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
      width:
          1400, // Ajusta según la cantidad de espacios de estacionamientoMeyerGuardia
      height: 500,
      color: Color(0xFFE0E0E0),
      child: Stack(
        children: [
          ParkingSpot(
            id: 'spot108',
            top: 430,
            left: 40,
          ),
          ParkingSpot(id: 'spot109', top: 430, left: 100, usuarioId: usuarioId),
          ParkingSpot(id: 'spot110', top: 430, left: 160, usuarioId: usuarioId),
          ParkingSpot(id: 'spot111', top: 430, left: 220, usuarioId: usuarioId),
          ParkingSpot(id: 'spot112', top: 430, left: 280, usuarioId: usuarioId),
          ParkingSpot(id: 'spot113', top: 430, left: 340, usuarioId: usuarioId),
          ParkingSpot(id: 'spot114', top: 430, left: 400, usuarioId: usuarioId),
          ParkingSpot(id: 'spot115', top: 430, left: 460, usuarioId: usuarioId),
          ParkingSpot(id: 'spot116', top: 290, left: 40, usuarioId: usuarioId),
          ParkingSpot(id: 'spot117', top: 290, left: 100, usuarioId: usuarioId),
          ParkingSpot(id: 'spot118', top: 290, left: 160, usuarioId: usuarioId),
          ParkingSpot(id: 'spot119', top: 290, left: 220, usuarioId: usuarioId),
          ParkingSpot(id: 'spot120', top: 290, left: 280, usuarioId: usuarioId),
          ParkingSpot(id: 'spot121', top: 290, left: 340, usuarioId: usuarioId),
          ParkingSpot(id: 'spot122', top: 290, left: 400, usuarioId: usuarioId),
          ParkingSpot(id: 'spot123', top: 290, left: 460, usuarioId: usuarioId),
          ParkingSpot(id: 'spot124', top: 430, left: 860, usuarioId: usuarioId),
          ParkingSpot(id: 'spot125', top: 430, left: 920, usuarioId: usuarioId),
          ParkingSpot(id: 'spot126', top: 430, left: 980, usuarioId: usuarioId),
          ParkingSpot(id: 'spot127', top: 430, left: 1040, usuarioId: usuarioId),
          ParkingSpot(id: 'spot128', top: 430, left: 1100, usuarioId: usuarioId),
          ParkingSpot(id: 'spot129', top: 430, left: 1160, usuarioId: usuarioId),
          ParkingSpot(id: 'spot130', top: 430, left: 1220, usuarioId: usuarioId),
          ParkingSpot(id: 'spot131', top: 430, left: 1280, usuarioId: usuarioId),
          ParkingSpot(id: 'spot132', top: 290, left: 860, usuarioId: usuarioId),
          ParkingSpot(id: 'spot133', top: 290, left: 920, usuarioId: usuarioId),
          ParkingSpot(id: 'spot134', top: 290, left: 980, usuarioId: usuarioId),
          ParkingSpot(id: 'spot135', top: 290, left: 1040, usuarioId: usuarioId),
          ParkingSpot(id: 'spot136', top: 290, left: 1100, usuarioId: usuarioId),
          ParkingSpot(id: 'spot137', top: 290, left: 1160, usuarioId: usuarioId),
          ParkingSpot(id: 'spot138', top: 290, left: 1220, usuarioId: usuarioId),
          ParkingSpot(id: 'spot139', top: 290, left: 1280, usuarioId: usuarioId),
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
                            idEspacio: id, Edificio: 'Central',usuarioId: usuarioId,)),
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
