// ignore_for_file: avoid_print, library_private_types_in_public_api, use_key_in_widget_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<Map<String, String>> buildingsMeyer = [
  {
    'imagePath': 'assets/edificio1.png',
    'description': 'Principal',
  },
];

final List<Map<String, String>> buildingsChuyaca = [
  {
    'imagePath': 'assets/edificio1.png',
    'description': 'Central',
  },
  {
    'imagePath': 'assets/edificio2.png',
    'description': 'Aulas Virtuales',
  },
  {
    'imagePath': 'assets/edificio3.png',
    'description': 'ITR',
  },
];

class BuildingCard extends StatelessWidget {
  final String imagePath;
  final String description;

  const BuildingCard({
    required this.imagePath,
    required this.description,
    Key? key,
  }) : super(key: key);

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

class Edificio extends StatefulWidget {
  final String? sede;

  const Edificio({this.sede, Key? key}) : super(key: key);

  @override
  _EdificioState createState() => _EdificioState();
}

class _EdificioState extends State<Edificio> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  List<Map<String, String>> get buildings {
    return widget.sede == 'Meyer' ? buildingsMeyer : buildingsChuyaca;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color(0xFF003DA6),
          flexibleSpace: Align(
            alignment: const Alignment(0.0, 0.8),
            child: GestureDetector(
              onTap: () {
                print('Imagen presionada');
                Navigator.pushNamed(context, '/');
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
              'Edificios',
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
                final edificioSeleccionado =
                    buildings[_currentIndex]['description']!;
                print('Edificio seleccionado: $edificioSeleccionado');
                Navigator.pop(context, edificioSeleccionado);
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
    );
  }
}
