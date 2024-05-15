// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'pag5.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});
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
              onPressed: () async {
                print('¡El botón de inicio de sesión ha sido presionado!');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Index()),
                );
              },
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
                    print('registrate click');
                    // Agrega la lógica para el botón de Registro
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
            const SizedBox(height: 70.0),
          ],
        ),
      ),
    );
  }
}
