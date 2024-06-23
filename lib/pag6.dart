// ignore_for_file: prefer_const_constructors, avoid_print, use_super_parameters, prefer_const_constructors_in_immutables, non_constant_identifier_names, unnecessary_this

import 'package:flutter/material.dart';
import 'package:pum/pag14.dart';

class ConfirmacionReserva extends StatelessWidget {
  final String HoraSel;
  final String EdiSel;
  final String VehSel;
  final String SedeSel;

  const ConfirmacionReserva({
    required this.HoraSel,
    required this.EdiSel,
    required this.VehSel,
    required this.SedeSel,
    Key? key,
  }) : super(key: key);

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
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edificio',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Text(
                  EdiSel,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Lugar',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 10),
                Text(
                  SedeSel, // Usando SedeSel en lugar de un valor fijo 'AV001'
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Hora',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Text(
                  HoraSel, // Usando HoraSel en lugar de un valor fijo '00:00 hrs'
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Tipo Vehiculo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                SizedBox(height: 10),
                Text(
                  VehSel, // Usando VehSel en lugar de un valor fijo 'Mediano'
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para el botón de Reservar
              print('Reservar ha sido presionado!');
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
