// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, duplicate_ignore, unused_element

import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistroVehiculo(),
    );
  }
}

class RegistroVehiculo extends StatefulWidget {
  @override
  _RegistroVehiculoState createState() => _RegistroVehiculoState();
}

class _RegistroVehiculoState extends State<RegistroVehiculo> {

  void _onItemTapped(int index) {
    setState(() {
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
              'Registro Vehículo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
            ),
            const SizedBox(height: 70.0),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*const Text(
                  'Registro Vehículo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                ),
                const SizedBox(height: 70.0),*/
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Marca',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Modelo',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Año',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Patente',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 70, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Color',
                      hintStyle: TextStyle(
                        fontSize: 20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 2, color: Color(0xFF003DA6)),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                /*ElevatedButton(
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
                    'Registrar Auto',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF003DA6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),*/
              ],
            ),

            const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de Edificio
                    print('Registrar Auto ha sido presionado!');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320, 40),
                    padding: const EdgeInsets.all(10.0),
                    side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
                  ),
                  child: const Text(
                    'Registrar Auto',
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
      ), );
  }
}
