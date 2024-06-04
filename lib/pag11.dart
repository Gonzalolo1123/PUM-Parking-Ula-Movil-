// ignore_for_file: prefer_const_constructors, avoid_print, use_super_parameters, unused_element

import 'package:flutter/material.dart';

import 'pag14.dart';

class CodigoManual extends StatelessWidget {
  const CodigoManual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 300, // Ajusta la altura según sea necesario
      width: screenWidth,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 6),
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Ingrese Codigo',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 320,
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Codigo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // Added SizedBox for spacing
          ElevatedButton(
            onPressed: () {
              // Lógica para el botón de Edificio
              print('Reservar ha sido presionado!');
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReservaCompletada()),
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
        ],
      ),
    );
  }
}
