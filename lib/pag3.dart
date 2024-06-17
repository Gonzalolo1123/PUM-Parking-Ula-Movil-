// ignore_for_file: avoid_print, use_super_parameters, library_private_types_in_public_api, use_build_context_synchronously, prefer_interpolation_to_compose_strings, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'pag2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LogUp extends StatelessWidget {
  const LogUp({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController apellidoController = TextEditingController();
    TextEditingController correoController = TextEditingController();
    TextEditingController contrasenaController = TextEditingController();
    TextEditingController confirmarContrasenaController =
        TextEditingController();

    Future<void> registrarUsuario() async {
      final String nombre = nombreController.text;
      final String apellido = apellidoController.text;
      final String correo = correoController.text;
      final String contrasena = contrasenaController.text;
      final String confirmarContrasena = confirmarContrasenaController.text;

      // Verificar si las contraseñas coinciden
      if (contrasena != confirmarContrasena) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Las contraseñas no coinciden')),
        );
        return;
      }

      // Datos a enviar
      Map<String, String> datos = {
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'contraseña': contrasena,
        'confirmarContraseña': confirmarContrasena,
      };

      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:3000/usuarios/registro'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(datos),
        );

        if (response.statusCode == 302) {
          // Mostrar mensaje de éxito y redirigir a la página de inicio de sesión
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuario registrado exitosamente')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogIn()),
          );
        } else {
          // Mostrar mensaje de error si la respuesta no es 200
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error al registrar el usuario')),
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

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo3.png',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    'Crear Cuenta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      controller: nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      controller: apellidoController,
                      decoration: const InputDecoration(
                        labelText: 'Apellido',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      controller: correoController,
                      decoration: const InputDecoration(
                        labelText: 'Correo',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      controller: contrasenaController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      controller: confirmarContrasenaController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirmar Contraseña',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: registrarUsuario,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 40),
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: const Color(0xFF87CEEB),
                    ),
                    child: const Text(
                      'Crear Cuenta',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF003DA6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes cuenta?',
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
                                builder: (context) => const LogIn()),
                          );
                        },
                        child: const Text(
                          'Iniciar Sesión',
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
                ],
              ),
              const SizedBox(height: 27.0),
            ],
          ),
        ),
      ),
    );
  }
}
