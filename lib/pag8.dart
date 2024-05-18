import 'package:flutter/material.dart';

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
          children: [
            const SizedBox(
              height: 20.0,
            ),
            // Aquí va el contenido del cuerpo de la pantalla
            ElevatedButton(
              onPressed: () {
                // Agrega la lógica para el botón de Crear Cuenta
                print('¡Vehículo ha sido presionado!');
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogUp()),
                );*/
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                backgroundColor: const Color(0xFF87CEEB),
              ),
              child: const Text(
                'Vehículo',
                style: TextStyle(
                  fontSize: 25,
                  // Ajusta el tamaño de fuente según tus necesidades
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 330,
                  height: 50,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para el botón de Hora
                          print('Hora ha sido presionado!');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(160, 40),
                          padding: const EdgeInsets.all(10.0),
                          backgroundColor: const Color(0xFF87CEEB),
                        ),
                        child: const Text(
                          'Hora',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF003DA6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0), // Espacio entre los botones
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para el botón de Edificio
                          print('Edificio ha sido presionado!');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(160, 40),
                          padding: const EdgeInsets.all(10.0),
                          backgroundColor: const Color(0xFF87CEEB),
                        ),
                        child: const Text(
                          'Edificio',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF003DA6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: 320,
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9), // Color de fondo
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para el botón de Edificio
                print('Reservar ha sido presionado!');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Reservar',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
