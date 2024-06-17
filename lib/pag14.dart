// ignore_for_file: library_private_types_in_public_api, avoid_print, unused_field, unused_element

import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReservaCompletada(),
    );
  }
}

class ReservaCompletada extends StatefulWidget {
  const ReservaCompletada({super.key});

  @override
  _ReservaCompletadaState createState() => _ReservaCompletadaState();
}

class _ReservaCompletadaState extends State<ReservaCompletada> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 350, // Ajusta el ancho según tus necesidades
              height: 70, // Ajusta el alto según tus necesidades
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '¡Tienes una reserva!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(height: 2.0),

                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Edificio',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize:
                            14, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 1, // Ajusta el alto según tus necesidades
                  child: Divider(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 16.0),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Aulas Virtuales',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                ),

                const SizedBox(height: 5.0),

                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lugar',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize:
                            14, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 1, // Ajusta el alto según tus necesidades
                  child: Divider(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 16.0),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'AV001',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                ),

                const SizedBox(height: 5.0),

                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hora',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize:
                            14, // Ajusta el tamaño de fuente según tus necesidades
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 1, // Ajusta el alto según tus necesidades
                  child: Divider(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 16.0),

                const SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  //height: 30, // Ajusta el alto según tus necesidades
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '00:00 hrs',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 1.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para el botón de Edificio
                print('Finalizar Reserva ha sido presionado!');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Finalizar Reserva',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //const SizedBox(height: 2.0),

            ElevatedButton(
              onPressed: () {
                // Lógica para el botón de Edificio
                print('Aumentar Reserva ha sido presionado!');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Aumentar Reserva',
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
