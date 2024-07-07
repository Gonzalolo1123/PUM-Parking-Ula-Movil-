// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields, unused_field, unused_element, must_be_immutable, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportesGuardia extends StatefulWidget {
  final String idEspacio;
  final String Edificio;
  final String? usuarioId;

  ReportesGuardia(
      {required this.idEspacio, required this.Edificio, this.usuarioId});

  @override
  _ReportesGuardiaState createState() => _ReportesGuardiaState();
}

class _ReportesGuardiaState extends State<ReportesGuardia> {
  String? _usuarioId;
  final TextEditingController patenteController = TextEditingController();
  final TextEditingController reporteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _usuarioId = widget.usuarioId;
  }

  Future<void> submitReport() async {
    final String patente = patenteController.text;
    final String reporte = reporteController.text;

    final Uri url = Uri.parse(
        'https://website-parking-ulagos.onrender.com/usuarios/reporteGuardia');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id_espacio': widget.idEspacio,
        'patente': patente,
        'reporte': reporte,
        'usuarioId': _usuarioId
      }),
    );

    if (response.statusCode == 201) {
      print('Report submitted successfully');
      if (mounted) {
        // Check if the widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Report submitted successfully')),
        );
      }
    } else {
      print('Failed to submit report');
      if (mounted) {
        // Check if the widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit report')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String idEspacio = widget.idEspacio;
    String Edificio = widget.Edificio;

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFF003DA6),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 100),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoSEG.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoGPS.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    'Registro de Reporte',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edificio: $Edificio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Estacionamiento: $idEspacio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: patenteController,
                          decoration: const InputDecoration(
                            labelText: 'Patente',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Color(0xFF003DA6),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: 300,
                        height: 120,
                        child: TextFormField(
                          controller: reporteController,
                          decoration: const InputDecoration(
                            labelText: 'Reporte',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Color(0xFF003DA6),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          print('Enviar Reporte ha sido presionado!');
                          submitReport();
                          Navigator.pop(context); // Cerrar el AlertDialog
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 40),
                          padding: const EdgeInsets.all(10.0),
                          side: const BorderSide(
                            width: 2.0,
                            color: Color(0xFF003DA6),
                          ),
                        ),
                        child: const Text(
                          'Enviar Reporte',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EliminarReservaGuardia extends StatefulWidget {
  final String idEspacio;
  final String Edificio;

  EliminarReservaGuardia({required this.idEspacio, required this.Edificio});

  @override
  _EliminarReservaGuardiaState createState() => _EliminarReservaGuardiaState();
}

class _EliminarReservaGuardiaState extends State<EliminarReservaGuardia> {
  final TextEditingController patenteController = TextEditingController();

  Future<void> eliminarReserva() async {
    final Uri url = Uri.parse(
        'https://website-parking-ulagos.onrender.com/usuarios/eliminarReservaGuardia');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id_espacio': widget.idEspacio,
      }),
    );

    if (response.statusCode == 201) {
      print('Reserva eliminada exitosamente');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reserva eliminada exitosamente')),
      );
    } else {
      print('Error al eliminar la reserva');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar la reserva')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String idEspacio = widget.idEspacio;
    String Edificio = widget.Edificio;

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFF003DA6),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 100),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoSEG.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoGPS.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    'Eliminar Reserva',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edificio: $Edificio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Estacionamiento: $idEspacio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          print('Eliminar Reserva ha sido presionado!');
                          eliminarReserva();
                          Navigator.pop(context); // Cerrar el AlertDialog
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 40),
                          padding: const EdgeInsets.all(10.0),
                          side: const BorderSide(
                            width: 2.0,
                            color: Color(0xFF003DA6),
                          ),
                        ),
                        child: const Text(
                          'Eliminar Reserva',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IngresarReservaGuardia extends StatefulWidget {
  final String idEspacio;
  final String Edificio;

  IngresarReservaGuardia({required this.idEspacio, required this.Edificio});

  @override
  _IngresarReservaGuardiaState createState() => _IngresarReservaGuardiaState();
}

class _IngresarReservaGuardiaState extends State<IngresarReservaGuardia> {
  final TextEditingController patenteController = TextEditingController();
  int _hourSalida = 17; // Hora de salida por defecto
  int _minuteSalida = 0; // Minuto de salida por defecto
  String _horaSalidaSeleccionada =
      '17:00'; // String para mostrar la hora de salida seleccionada

  // Método para actualizar la hora y el minuto de salida
  void _updateTimeSalida(int hour, int minute) {
    setState(() {
      _hourSalida = hour;
      _minuteSalida = minute;
      _horaSalidaSeleccionada =
          '$_hourSalida:${_minuteSalida.toString().padLeft(2, '0')}'; // Formato HH:MM
    });
  }

  // Getter para obtener el valor de _horaSalidaSeleccionada
  String get horaSalidaSeleccionada => _horaSalidaSeleccionada;

  Future<void> ingresarReserva() async {
    final String patente = patenteController.text;
    final String horaSalida = horaSalidaSeleccionada;

    final Uri url = Uri.parse(
        'https://website-parking-ulagos.onrender.com//usuarios/reservaGuardia');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id_espacio': widget.idEspacio,
        'patente': patente,
        'hora_salida': horaSalida,
      }),
    );

    if (mounted) {
      // Verifica si el widget está montado
      if (response.statusCode == 201) {
        print('Reserva ingresada exitosamente');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reserva ingresada exitosamente')),
        );
      } else {
        print('Error al ingresar la reserva');
        print(response.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al ingresar la reserva')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String idEspacio = widget.idEspacio;
    String Edificio = widget.Edificio;

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFF003DA6),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 100),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoSEG.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        print('Imagen presionada');
                      },
                      child: Image.asset(
                        'assets/logoGPS.png',
                        height: 55,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    'Ingresar Reserva',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edificio: $Edificio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Estacionamiento: $idEspacio',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: patenteController,
                          decoration: const InputDecoration(
                            labelText: 'Patente',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Color(0xFF003DA6),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      _buildTimePicker(
                        'Hora de Salida',
                        _hourSalida,
                        _minuteSalida,
                        _updateTimeSalida,
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          print('Ingresar Reserva ha sido presionado!');
                          ingresarReserva();
                          Navigator.pop(context); // Cerrar el AlertDialog
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 40),
                          padding: const EdgeInsets.all(10.0),
                          side: const BorderSide(
                            width: 2.0,
                            color: Color(0xFF003DA6),
                          ),
                        ),
                        child: const Text(
                          'Ingresar Reserva',
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
                ],
              ),
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

class ReportesUsuario extends StatefulWidget {
  final String usuarioId;
  ReportesUsuario(this.usuarioId);

  @override
  _ReportesUsuarioState createState() => _ReportesUsuarioState();
}

class _ReportesUsuarioState extends State<ReportesUsuario> {
  String? _usuarioId;
  List<dynamic> reportes = [];

  @override
  void initState() {
    super.initState();
    _usuarioId = widget.usuarioId;
    _reportesUsuarios();
  }

  Future<void> _reportesUsuarios() async {
    // Datos a enviar
    Map<String, String> dato = {
      'usuarioId': _usuarioId!,
    };

    try {
      final response = await http.post(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/selectReportes'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dato),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData is List) {
          setState(() {
            reportes = responseData;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No se encontraron reportes.')),
          );
        }
      } else {
        print('Error al obtener los reportes: ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexion $e');
    }
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Reporte de Estacionamiento',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: reportes.isEmpty
                ? Center(
                    child: Text(
                      'Sin reportes',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ) // Si no hay reportes, muestra un contenedor vacío
                : ListView.builder(
                    itemCount: reportes.length,
                    itemBuilder: (context, index) {
                      final reporte = reportes[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(
                            'Reporte de Estacionamiento',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Reporte: ${reporte['reporte']}'),
                              Text('Espacio: ${reporte['id_espacio']}'),
                            ],
                          ),
                          onTap: () {
                            // Aquí puedes manejar el evento de toque del reporte si es necesario
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
