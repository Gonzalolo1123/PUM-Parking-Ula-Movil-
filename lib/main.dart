// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pag2.dart';
import 'pag3.dart';
import 'pag4.dart';

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

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cerrar aplicación'),
            content: const Text(
                '¿Estás seguro de que quieres cerrar la aplicación?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text('Sí'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenido a Parking Ulagos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10), // Espacio entre los textos
                      Text(
                        'Ingresa con tus credenciales universitarias o como visita para registrar tu estancia.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 20.0), // Espacio entre la imagen y los botones
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 40),
                    padding: const EdgeInsets.all(10.0),
                    backgroundColor: const Color(0xFF003DA6),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0), // Espacio entre los botones
                ElevatedButton(
                  onPressed: () {
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
                      fontSize: 20,
                      color: Color(0xFF003DA6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0), // Espacio entre los botones
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInGuest()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                  ),
                  child: const Text(
                    'Continuar como invitado',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
