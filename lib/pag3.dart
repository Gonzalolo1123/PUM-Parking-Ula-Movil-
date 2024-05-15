// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LogUp extends StatelessWidget {
  const LogUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                const Text(
                  'Iniciar SesiónFRIZOOOOOOO',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
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
                    // Agrega la lógica para el botón de Iniciar Sesión
                    print('¡El botón de inicio de sesión ha sido presionado!');
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );*/
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 40),
                    padding: const EdgeInsets.all(10.0),
                    backgroundColor: const Color(0xFF003DA6),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize:
                          20, // Ajusta el tamaño de fuente según tus necesidades
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
                    const SizedBox(width: 5), // Espacio entre los textos
                    GestureDetector(
                      onTap: () {
                        print('registrate click');
                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LogUp()),
                        );
                        */
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
