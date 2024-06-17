// ignore_for_file: prefer_const_constructors, avoid_print, use_super_parameters

import 'package:flutter/material.dart';

class ConfirmacionReserva extends StatelessWidget {
  const ConfirmacionReserva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 560, // Ajusta la altura según sea necesario
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
          Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 30,
                right: 30), // Ajusta el padding según tus necesidades
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Edificio',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Text(
                  'Aulas Virtuales',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Lugar',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 10),
                Text(
                  'AV001',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Hora',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Text(
                  '00:00 hrs',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Tipo Vehiculo',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 10),
                Text(
                  'Mediano',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                
              ],
            ),
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
