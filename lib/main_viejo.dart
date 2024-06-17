// ignore_for_file: avoid_print 

import 'package:flutter/material.dart';
import 'pag3.dart';
import 'pag4.dart';

import 'main_testing.dart'; // PARA TESTING

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Inicio(),
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Agrega tu imagen aquí
          Image.asset(
            'assets/logo.png',
          ),
          const SizedBox(width: 10.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Bienvenido a Parking Ulagos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Text(
                  'Ingresa con tus credenciales universitarias o como visita para registrar tu estancia.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10.0), // Espacio entre la imagen y los botones
          ElevatedButton(
            onPressed: () async {
              // Agrega la lógica para el botón de Iniciar Sesión
              print('¡El botón de inicio de sesión ha sido presionado!');
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogIn()),
              );*/
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 40),
              padding: const EdgeInsets.all(10.0),
              backgroundColor: const Color(0xFF003DA6),
            ),
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize:
                    20, // Ajusta el tamaño de fuente según tus necesidades
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0), // Espacio entre los botones
          ElevatedButton(
            onPressed: () {
              // Agrega la lógica para el botón de Crear Cuenta
              //print('¡El botón de crear cuenta ha sido presionado!');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogUp()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 40),
              padding: const EdgeInsets.all(10.0),
              backgroundColor: const Color(0xFF87CEEB),
            ),
            child: const Text(
              'Crear Cuenta',
              style: TextStyle(
                fontSize:
                    20, // Ajusta el tamaño de fuente según tus necesidades
                color: Color(0xFF003DA6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0), // Espacio entre los botones
          TextButton(
            onPressed: () {
              // Función que se ejecuta cuando se presiona el botón
              //print('¡El botón de invitado ha sido presionado!');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogInGuest()),
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(15.0),
            ),
            child: const Text(
              'Continuar como invitado',
              style: TextStyle(
                fontSize: 12,
                // Ajusta el tamaño de fuente según tus necesidades
                color: Colors.black, // Color del texto
              ),
            ),
          ),

          // PARA TESTING

          ElevatedButton(
            onPressed: () {
              // Agrega la lógica para el botón de Crear Cuenta
              //print('¡El botón de crear cuenta ha sido presionado!');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const testing()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 40),
              padding: const EdgeInsets.all(10.0),
              backgroundColor: const Color(0xFF87CEEB),
            ),
            child: const Text(
              'TESTING',
              style: TextStyle(
                fontSize:
                    20, // Ajusta el tamaño de fuente según tus necesidades
                color: Color(0xFF003DA6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // PARA TESTING

        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

import 'package:postgres/postgres.dart';

void main() async {
  final conn = await Connection.open(
    Endpoint(
      host: 'BLABLABLA',
      database: 'BLABLABLA',
      username: 'BLABLABLA',
      password: 'BLABLABLA',
    ),
    // The postgres server hosted locally doesn't have SSL by default. If you're
    // accessing a postgres server over the Internet, the server should support
    // SSL and you should swap out the mode with `SslMode.verifyFull`.
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );
  print('has connection!');
}*/
