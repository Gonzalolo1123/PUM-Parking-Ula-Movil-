import 'package:flutter/material.dart';


import 'package:carousel_slider/carousel_slider.dart'; // Carrusel

class Index extends StatelessWidget {
  // ignore: use_key_in_widget_constructors 
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Edificio(),
    );
  }
}

class Edificio extends StatefulWidget {
  @override
  _EdificioState createState() => _EdificioState();
}

class _EdificioState extends State<Edificio> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            const SizedBox(height: 70.0),
            CarouselSlider( // Inicia carrusel
                options: CarouselOptions(height: 400.0),
                items: [
                card1(),
                card2(),
                card3(),
              ],

                  ),

            const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de Edificio
                    print('Seleccionar ha sido presionado!');
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.qr_code_outlined, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.directions_car, 2),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF003DA6),
        backgroundColor: const Color(0xFF003DA6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _selectedIndex == index ? Colors.white : Colors.transparent,
      ),
      padding: const EdgeInsets.all(5.0), // Espacio alrededor del icono
      child: Icon(
        icon,
        size: 40.0,
        color: _selectedIndex == index ? const Color(0xFF003DA6) : Colors.white,
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
        color: Colors.grey,
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,

        child: SizedBox(
            width: 300,
            height: 300,

        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: <Widget>[Image.asset(
                'edificio1.png',
                width: 270,
                height: 270,
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
        color: Colors.grey,
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,

        child: SizedBox(
            width: 300,
            height: 300,

        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: <Widget>[Image.asset(
                'edificio2.png',
                width: 270,
                height: 270,
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
        color: Colors.grey,
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,

        child: SizedBox(
            width: 300,
            height: 300,

        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: <Widget>[Image.asset(
                'edificio3.png',
                width: 270,
                height: 270,
              ), // Añade la imágen
            //),
            //const Text('edificio3')
          ],
        ),
      ),


      ),
    );
  }
}
