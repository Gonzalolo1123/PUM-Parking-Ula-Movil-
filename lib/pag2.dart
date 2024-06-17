// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'pag3.dart';
import 'pag8b.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  void dispose() {
    _correoController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  Future<void> _iniciarSesion() async {
    final String correo = _correoController.text;
    final String contrasena = _contrasenaController.text;

    // Datos a enviar
    Map<String, String> datos = {
      'correo': correo,
      'contraseña': contrasena,
    };

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/usuarios/iniciosesion'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datos),
      );

      if (response.statusCode == 302) {
        // Navega a la página de sedes
        print("Datos obtenidos exitosamente");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Sede()), // Asegúrate de definir este widget
        );
      } else {
        // Mostrar mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
        print(response.statusCode);
      }
    } catch (e) {
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(height: 10.0),
            const Text(
              'Iniciar Sesión',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                controller: _correoController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                controller: _contrasenaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _iniciarSesion,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 40),
                padding: const EdgeInsets.all(10.0),
                backgroundColor: const Color(0xFF003DA6),
              ),
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿No tienes Cuenta?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(130, 0, 0, 0),
                    decorationColor: Color.fromARGB(130, 0, 0, 0),
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LogUp()), // Asegúrate de definir este widget
                    );
                  },
                  child: const Text(
                    'Registrate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(130, 0, 0, 0),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(130, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 115.1),
          ],
        ),
      ),
    );
  }
}
