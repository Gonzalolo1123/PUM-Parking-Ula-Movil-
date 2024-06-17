// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, duplicate_ignore, avoid_print, camel_case_types, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Carrusel
import 'pag5.dart';

class Sede extends StatefulWidget {
  @override
  _SedeState createState() => _SedeState();
}

class _SedeState extends State<Sede> {
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
              'Sedes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
            ),
            CarouselSlider(
              // Inicia carrusel
              options: CarouselOptions(height: 400.0),
              items: const [
                card1(),
                card2(),
                card3(),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para el botón de Edificio
                print('Seleccionar ha sido presionado!');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Index()),
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
    );
  }
}

// IMÁGENES
// Cards para cada edificio (método que utilize para la pokedex -s)

// Primer card con primera imágen y descripción
class card1 extends StatelessWidget {
  const card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,

        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/edificio1.png',
                width: 300,
                height: 300,
              ), // Añade la imágen
              //),
              //const Text('edificio1')
            ],
          ),
        ),
      ),
    );
  }
}

// Segundo card con segunda imágen y descripción
class card2 extends StatelessWidget {
  const card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,

        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/edificio2.png',
                width: 300,
                height: 300,
              ), // Añade la imágen
              //),
              //const Text('edificio2')
            ],
          ),
        ),
      ),
    );
  }
}

// Tercer card con tercera imágen y descripción
class card3 extends StatelessWidget {
  const card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,

        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/edificio3.png',
                  width: 300, height: 300), // Añade la imágen
              //),
              //const Text('edificio3')
            ],
          ),
        ),
      ),
    );
  }
}
