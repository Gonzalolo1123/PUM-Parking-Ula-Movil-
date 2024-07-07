// ignore_for_file: library_private_types_in_public_api, use_super_parameters, avoid_print

import 'package:flutter/material.dart';

class Hora extends StatefulWidget {
  const Hora({Key? key}) : super(key: key);

  @override
  _HoraState createState() => _HoraState();
}

// Clase de estado
class _HoraState extends State<Hora> {
  int _hourEntrada = 8; // Hora de entrada por defecto
  int _minuteEntrada = 0; // Minuto de entrada por defecto
  String _horaEntradaSeleccionada = '08:00'; // String para mostrar la hora de entrada seleccionada

  int _hourSalida = 17; // Hora de salida por defecto
  int _minuteSalida = 0; // Minuto de salida por defecto
  String _horaSalidaSeleccionada = '17:00'; // String para mostrar la hora de salida seleccionada

  // Método para actualizar la hora y el minuto de entrada
  void _updateTimeEntrada(int hour, int minute) {
    setState(() {
      _hourEntrada = hour;
      _minuteEntrada = minute;
      _horaEntradaSeleccionada =
          '$_hourEntrada:${_minuteEntrada.toString().padLeft(2, '0')}'; // Formato HH:MM
    });
  }

  // Método para actualizar la hora y el minuto de salida
  void _updateTimeSalida(int hour, int minute) {
    setState(() {
      _hourSalida = hour;
      _minuteSalida = minute;
      _horaSalidaSeleccionada =
          '$_hourSalida:${_minuteSalida.toString().padLeft(2, '0')}'; // Formato HH:MM
    });
  }

  // Getter para obtener el valor de _horaEntradaSeleccionada
  String get horaEntradaSeleccionada => _horaEntradaSeleccionada;

  // Getter para obtener el valor de _horaSalidaSeleccionada
  String get horaSalidaSeleccionada => _horaSalidaSeleccionada;

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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Seleccionar Horas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 30),
                _buildTimePicker(
                  'Hora de Entrada',
                  _hourEntrada,
                  _minuteEntrada,
                  _updateTimeEntrada,
                ),
                const SizedBox(height: 30),
                _buildTimePicker(
                  'Hora de Salida',
                  _hourSalida,
                  _minuteSalida,
                  _updateTimeSalida,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    print('Hora de entrada enviada: $horaEntradaSeleccionada');
                    print('Hora de salida enviada: $horaSalidaSeleccionada');
                    Navigator.pop(context, {'entrada': horaEntradaSeleccionada, 'salida': horaSalidaSeleccionada});
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320, 40),
                    padding: const EdgeInsets.all(10.0),
                    side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
                  ),
                  child: const Text(
                    'Seleccionar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF003DA6),
                      fontWeight: FontWeight.bold,
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

  Widget _buildTimePicker(
      String label, int hour, int minute, Function(int, int) onUpdate) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
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
                      hour = (hour + 1) % 24;
                      onUpdate(hour, minute);
                    });
                  },
                ),
                Text(
                  hour.toString().padLeft(2, '0'),
                  style: const TextStyle(fontSize: 50, color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      hour = (hour - 1 + 24) % 24;
                      onUpdate(hour, minute);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(width: 10),
            const Text(
              ':',
              style: TextStyle(fontSize: 50, color: Colors.grey),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_drop_up, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      minute = (minute + 1) % 60;
                      onUpdate(hour, minute);
                    });
                  },
                ),
                Text(
                  minute.toString().padLeft(2, '0'),
                  style: const TextStyle(fontSize: 50, color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      minute = (minute - 1 + 60) % 60;
                      onUpdate(hour, minute);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
