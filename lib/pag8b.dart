// ignore_for_file: avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_declarations, unused_field, deprecated_member_use, prefer_const_constructors, unnecessary_import, prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'pag5.dart';

// Lista de datos de los edificios
final List<Map<String, String>> buildings = [
  {
    'imagePath': 'assets/edificio1.png',
    'description': 'Chuyaca',
  },
  {
    'imagePath': 'assets/edificio2.png',
    'description': 'Meyer',
  },
];

class BuildingCard extends StatelessWidget {
  final String imagePath;
  final String description;

  const BuildingCard({
    required this.imagePath,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath,
                width: 300,
                height: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> _onWillPop(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Cerrar sesión'),
          content: Text('¿Estás seguro de que quieres cerrar sesión?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                // Aquí puedes agregar la lógica para cerrar sesión
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Inicio(),
                ));
              },
              child: Text('Sí'),
            ),
          ],
        ),
      ) ??
      false;
}

class Sede extends StatefulWidget {
  final String usuarioId;
  Sede(this.usuarioId);

  @override
  _SedeState createState() => _SedeState();
}

class _SedeState extends State<Sede> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  String? _usuarioId;

  @override
  void initState() {
    super.initState();
    _usuarioId = widget.usuarioId;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFF003DA6),
            flexibleSpace: Align(
              alignment: const Alignment(0.0, 0.8),
              child: GestureDetector(
                onTap: () {
                  print('Imagen presionada');
                },
                child: Image.asset(
                  'assets/logoGPS.png',
                  height: 55,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sedes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
              ),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 400.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: buildings.map((building) {
                  return Builder(
                    builder: (BuildContext context) {
                      return BuildingCard(
                        imagePath: building['imagePath']!,
                        description: building['description']!,
                      );
                    },
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  final sedeSeleccionada =
                      buildings[_currentIndex]['description']!;
                  print('Sede seleccionado: $sedeSeleccionada');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                            sedesel: sedeSeleccionada, usuarioId: _usuarioId)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 40),
                  padding: const EdgeInsets.all(10.0),
                  side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
                ),
                child: const Text(
                  'Seleccionar',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF003DA6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
