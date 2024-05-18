// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'pag7.dart'; // PARA TESTING
import 'pag8.dart'; // PARA TESTING
import 'pag12.dart'; // PARA TESTING

class testing extends StatelessWidget {
  const testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

children: [

// PAG 7
ElevatedButton(
  onPressed: () {
    // Agrega la lógica para el botón de Crear Cuenta
    //print('¡El botón de crear cuenta ha sido presionado!');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistroVehiculo()),
    );
  },
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(300, 40),
    padding: const EdgeInsets.all(10.0),
    backgroundColor: const Color(0xFF87CEEB),
  ),
  child: const Text(
    'PAG 7',
    style: TextStyle(
      fontSize:
          20, // Ajusta el tamaño de fuente según tus necesidades
      color: Color(0xFF003DA6),
      fontWeight: FontWeight.bold,
    ),
  ),
),
const SizedBox(height: 10.0),


// PAG 8
ElevatedButton(
  onPressed: () {
    // Agrega la lógica para el botón de Crear Cuenta
    //print('¡El botón de crear cuenta ha sido presionado!');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Edificio()),
    );
  },
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(300, 40),
    padding: const EdgeInsets.all(10.0),
    backgroundColor: const Color(0xFF87CEEB),
  ),
  child: const Text(
    'PAG 8',
    style: TextStyle(
      fontSize:
          20, // Ajusta el tamaño de fuente según tus necesidades
      color: Color(0xFF003DA6),
      fontWeight: FontWeight.bold,
    ),
  ),
),
const SizedBox(height: 10.0),

// PAG 12
ElevatedButton(
  onPressed: () {
    // Agrega la lógica para el botón de Crear Cuenta
    //print('¡El botón de crear cuenta ha sido presionado!');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IndexSeguridad()),
    );
  },
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(300, 40),
    padding: const EdgeInsets.all(10.0),
    backgroundColor: const Color(0xFF87CEEB),
  ),
  child: const Text(
    'PAG 12',
    style: TextStyle(
      fontSize:
          20, // Ajusta el tamaño de fuente según tus necesidades
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
