// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'pag2.dart';

class LogInGuest extends StatelessWidget {
  const LogInGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo2.png',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                const Text(
                  'Invitados',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Motivo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    items: <String>['opcion1', 'opcion2', 'opcion3']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      if (value != null) {}
                    },
                  ),
                ),
                /*child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Motivo',
                      hintStyle: TextStyle(
                        fontSize:
                            15, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  ),
                ),*/
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Patente',
                      hintStyle: TextStyle(
                        fontSize:
                            15, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    // Agrega la lógica para el botón de Crear Cuenta
                    //print('¡El botón de crear cuenta ha sido presionado!');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 40),
                    padding: const EdgeInsets.all(10.0),
                    backgroundColor: const Color.fromARGB(255, 170, 170, 170),
                  ),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize:
                          20, // Ajusta el tamaño de fuente según tus necesidades
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿Ya eres parte de la Universidad?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(130, 0, 0, 0),
                        decorationColor: Color.fromARGB(130, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(width: 5), // Espacio entre los textos
                    GestureDetector(
                      onTap: () {
                        //print('iniciar sesión click');
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
                    const SizedBox(height: 179.0),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
