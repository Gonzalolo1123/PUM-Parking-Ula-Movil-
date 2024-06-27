// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa este paquete para usar TextInputFormatter
import 'package:http/http.dart' as http;
import 'package:pum/pag5.dart';

class RegistroVehiculo extends StatefulWidget {
  @override
  _RegistroVehiculoState createState() => _RegistroVehiculoState();
}

class _RegistroVehiculoState extends State<RegistroVehiculo> {
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController patenteController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  String tipoVehiculoSeleccionado = 'Auto';
  String tamanoSeleccionado = 'Mediano';

  List<String> tiposVehiculo = ['Auto', 'Camioneta', 'Moto'];
  List<String> tamanos = ['Pequeño', 'Mediano', 'Grande'];

  Future<void> registrarUsuario() async {
    final String modelo = modeloController.text;
    final String patente = patenteController.text;
    final String color = colorController.text;

    Map<String, String> datos = {
      'patente': patente,
      'tipo_vehiculo': tipoVehiculoSeleccionado,
      'color': color,
      'tamaño': tamanoSeleccionado,
      'modelo': modelo,
    };

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/usuarios/principal'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(datos),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vehículo registrado exitosamente')),
        );
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Index()),
          );
        });
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('La patente ingresada ya ha sido registrada')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrar el vehículo')),
        );
        print(response.statusCode);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión')),
      );
      print('Error de conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                const Text(
                  'Registro Vehículo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                ),
                const SizedBox(height: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Tipo de Vehículo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Color(0xFF003DA6),
                              width: 2.0,
                            ),
                          ),
                        ),
                        value: tipoVehiculoSeleccionado,
                        onChanged: (String? value) {
                          setState(() {
                            tipoVehiculoSeleccionado = value!;
                          });
                        },
                        items: tiposVehiculo.map((String tipo) {
                          return DropdownMenuItem<String>(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Tamaño',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Color(0xFF003DA6),
                              width: 2.0,
                            ),
                          ),
                        ),
                        value: tamanoSeleccionado,
                        onChanged: (String? value) {
                          setState(() {
                            tamanoSeleccionado = value!;
                          });
                        },
                        items: tamanos.map((String tamano) {
                          return DropdownMenuItem<String>(
                            value: tamano,
                            child: Text(tamano),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        controller: modeloController,
                        decoration: const InputDecoration(
                          labelText: 'Modelo',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      height: 60,
                      child: TextFormField(
                        controller: colorController,
                        decoration: const InputDecoration(
                          labelText: 'Color',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      height: 80,
                      child: TextFormField(
                        controller: patenteController,
                        maxLength: 6, // Permite hasta 7 caracteres con guiones
                        inputFormatters: [
                          UpperCaseTextFormatter(), // Convierte a mayúsculas
                          FilteringTextInputFormatter.deny(RegExp(r'[^A-Z0-9-]')), // Acepta solo letras mayúsculas, números y guiones
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Patente (Ej. XH6640)',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Color(0xFF003DA6),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        print('Registrar Auto ha sido presionado!');
                        registrarUsuario();
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
                        'Registrar Auto',
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
    );
  }
}

// Formateador para convertir todo a mayúsculas
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
