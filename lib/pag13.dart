// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManipulacionReserva(),
    );
  }
}

class ManipulacionReserva extends StatefulWidget {
  @override
  _ManipulacionReservaState createState() => _ManipulacionReservaState();
}

class _ManipulacionReservaState extends State<ManipulacionReserva> {
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
          flexibleSpace: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            const SizedBox(width: 100),
            
            SizedBox(
              width: 100, // Ajusta el ancho según tus necesidades
               //height: 30, // Ajusta el alto según tus necesidades
              child:
            Align(
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
            child:
            Align(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /*const Text(
              'Seleccionar Vehículo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
            ),
            const SizedBox(height: 70.0),*/

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(height: 2.0),

                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Edificio',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      /*border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),*/
                    ),
                  ),
                ),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Aulas Virtuales',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                ),

                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Lugar',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      /*border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),*/
                    ),
                  ),
                ),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'AV001',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                ),

                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      /*border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),*/
                    ),
                  ),
                ),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Libre/Ocupado/Reservado',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                ),

              ],
            ),

                const SizedBox(height: 1.0),
                const Text(
                  '¿Qué desea hacer?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),

                const SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de Edificio
                    print('Ingresar ha sido presionado!');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320, 40),
                    padding: const EdgeInsets.all(10.0),
                    side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
                  ),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF003DA6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 2.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de Edificio
                    print('Modificar ha sido presionado!');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320, 40),
                    padding: const EdgeInsets.all(10.0),
                    side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
                  ),
                  child: const Text(
                    'Modificar',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF003DA6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 2.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de Edificio
                    print('Alertar ha sido presionado!');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320, 40),
                    padding: const EdgeInsets.all(10.0),
                    side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
                  ),
                  child: const Text(
                    'Alertar',
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

