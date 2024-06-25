// ignore_for_file: library_private_types_in_public_api, use_super_parameters, avoid_print

import 'package:flutter/material.dart';


class Hora extends StatefulWidget {
  const Hora({Key? key}) : super(key: key);

  @override
  _HoraState createState() => _HoraState();
}

// Clase de estado
class _HoraState extends State<Hora> {
  int _hour = 8; // Hora por defecto
  int _minute = 0; // Minuto por defecto
  String _horaSeleccionada = '00:00'; // String para mostrar la hora seleccionada

  // Método para actualizar la hora y el minuto
  void _updateTime(int hour, int minute) {
    setState(() {
      _hour = hour;
      _minute = minute;
      _horaSeleccionada =
          '$_hour:${_minute.toString().padLeft(2, '0')}'; // Formato HH:MM
    });
  }

  // Getter para obtener el valor de _horaSeleccionada
  String get horaSeleccionada => _horaSeleccionada;

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
                print('Imagen presionada');
                Navigator.pushNamed(context, '/');
              },
              child: Image.asset(
                'assets/logoGPS.png',
                height: 55,
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Hora',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_up, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          _hour = (_hour + 1) % 24;
                          _updateTime(_hour, _minute);
                        });
                      },
                    ),
                    Text(
                      _hour.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 100, color: Colors.grey),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          _hour = (_hour - 1 + 24) % 24;
                          _updateTime(_hour, _minute);
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const Text(
                  ':',
                  style: TextStyle(fontSize: 100, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_up, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          _minute = (_minute + 1) % 60;
                          _updateTime(_hour, _minute);
                        });
                      },
                    ),
                    Text(
                      _minute.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 100, color: Colors.grey),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          _minute = (_minute - 1 + 60) % 60;
                          _updateTime(_hour, _minute);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Hora enviada: $horaSeleccionada');
                Navigator.pop(context, horaSeleccionada);
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
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
