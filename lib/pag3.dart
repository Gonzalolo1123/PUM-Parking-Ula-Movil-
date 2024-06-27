// ignore_for_file: avoid_print, use_super_parameters, library_private_types_in_public_api, use_build_context_synchronously, prefer_interpolation_to_compose_strings, use_key_in_widget_constructors, valid_regexps, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'pag2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LogUp extends StatefulWidget {
  const LogUp({Key? key}) : super(key: key);

  @override
  _LogUpState createState() => _LogUpState();
}

class _LogUpState extends State<LogUp> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController confirmarContrasenaController =
      TextEditingController();
  double passwordStrength = 0;

  double _calculatePasswordStrength(String password) {
    int criteriaMet = 0;

    if (password.length >= 10) criteriaMet++; // Longitud mínima de 8 caracteres
    if (RegExp(r'[A-Z]').hasMatch(password))
      criteriaMet++; // Tiene al menos una letra mayúscula
    if (RegExp(r'[a-z]').hasMatch(password))
      criteriaMet++; // Tiene al menos una letra minúscula
    if (RegExp(r'\d').hasMatch(password))
      criteriaMet++; // Tiene al menos un número
    if (RegExp(r'[@$!%*?&.,-]').hasMatch(password))
      criteriaMet++; // Tiene al menos un carácter especial

    return criteriaMet / 5; // Retorna un valor entre 0 y 1
  }

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

  @override
  void initState() {
    super.initState();
    contrasenaController.addListener(_updatePasswordStrength);
  }

  void _updatePasswordStrength() {
    setState(() {
      passwordStrength = _calculatePasswordStrength(contrasenaController.text);
    });
  }

  @override
  void dispose() {
    contrasenaController.removeListener(_updatePasswordStrength);
    contrasenaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo3.png',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      const Text(
                        'Crear Cuenta',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: TextFormField(
                          controller: nombreController,
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: 270,
                        child: LinearProgressIndicator(
                          value: passwordStrength,
                          backgroundColor: Colors.red,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            passwordStrength <= 0.33
                                ? Colors.red
                                : passwordStrength <= 0.66
                                    ? Colors.yellow
                                    : Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
        ),
      ),
    );
  }
}
