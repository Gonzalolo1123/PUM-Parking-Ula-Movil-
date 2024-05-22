// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class ConfirmacionReserva extends StatelessWidget {
  const ConfirmacionReserva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 500, // Ajusta la altura según sea necesario
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
            'Confirmación Reserva',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Edificio',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color: Colors.black54),
          ),
          SizedBox(height: 20),
          Text(
            'Aulas Virtuales',
            style: TextStyle(fontSize: 25),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para el botón de Edificio
              print('Reservar ha sido presionado!');
              Navigator.of(context).pop();
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
    );
  }
}
