// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, unused_field, unused_element

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'pag5.dart';

import 'dart:convert';

class Index extends StatelessWidget {
  // ignore: duplicate_ignore
  // ignore: use_key_in_widget_constructors
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistroVehiculo(),
    );
  }
}

class RegistroVehiculo extends StatefulWidget {
  @override
  _RegistroVehiculoState createState() => _RegistroVehiculoState();
}

class _RegistroVehiculoState extends State<RegistroVehiculo> {

  // INICIO INTERACCIÓN BACKEND

  final TextEditingController tipoVehiculoController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController anoController = TextEditingController();
  final TextEditingController patenteController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  Future<void> registrarUsuario() async {
    final String tipoVehiculo = tipoVehiculoController.text;
    final String modelo = modeloController.text;
    final String ano = anoController.text;
    final String patente = patenteController.text;
    final String color = colorController.text;

    // Datos a enviar
    Map<String, String> datos = {
      'tipoVehiculo': tipoVehiculo,
      'modelo': modelo,
      'ano': ano,
      'patente': patente,
      'color': color,
    };

    try {
      final response = await http.post(
        Uri.parse('https://website-parking-ulagos.onrender.com/usuarios/registroVehiculo'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datos),
      );

      if (response.statusCode == 302) {
        // Mostrar mensaje de éxito y redirigir a la página de inicio de sesión
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vehículo registrado exitosamente')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      } else {
        // Mostrar mensaje de error si la respuesta no es 200
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrar el vehículo')),
        );
        print(response.statusCode);
      }
    } catch (e) {
      // Mostrar mensaje de error si hay un error de conexión
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión')),
      );
      // Imprimir el mensaje de error en la consola
      print('Error de conexión: $e');
    }
  }

  // FIN INTERACCIÓN BACKEND

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
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
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 50, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    controller: tipoVehiculoController, // PARA INTERACCIÓN BACKEND
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Tipo de Vehiculo',
                      hintStyle: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF003DA6), width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 50, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    controller: modeloController, // PARA INTERACCIÓN BACKEND
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Modelo',
                      hintStyle: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF003DA6), width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 50, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    controller: anoController, // PARA INTERACCIÓN BACKEND
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Año',
                      hintStyle: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF003DA6), width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 50, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    controller: patenteController, // PARA INTERACCIÓN BACKEND
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Patente',
                      hintStyle: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF003DA6), width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 50, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    controller: colorController, // PARA INTERACCIÓN BACKEND
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Color',
                      hintStyle: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF003DA6), width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para el botón de Edificio
                print('Registrar Auto ha sido presionado!');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
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
      ),
    );
  }
}
