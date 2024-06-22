// ignore_for_file: unused_element, library_private_types_in_public_api, avoid_print, prefer_const_constructors, unnecessary_this, prefer_const_constructors_in_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:pum/pag9.dart';
import 'pag6.dart';
import 'pag7b.dart';
import 'pag8.dart';
/*
void _showReservarBottomSheet(BuildContext context, String horaSel,
    String ediSel, String vehSel, String sedeSel) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ConfirmacionReserva(
        HoraSel: horaSel,
        EdiSel: ediSel,
        VehSel: vehSel,
        SedeSel: sedeSel,
      );
    },
    isScrollControlled: true,
  );
}
*/
class Index extends StatelessWidget {
  final String? horaSel;
  final String? ediSel;
  final String? vehSel;
  final String? sedeSel;

  Index({
    this.horaSel,
    this.ediSel,
    this.vehSel,
    this.sedeSel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(horaSel: horaSel,ediSel: ediSel,vehSel: vehSel,sedeSel:sedeSel
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? horaSel;
  final String? ediSel;
  final String? vehSel;
  final String? sedeSel;

  MyHomePage({
    this.horaSel,
    this.ediSel,
    this.vehSel,
    this.sedeSel,
    super.key,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                print('¡Vehículo ha sido presionado!');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeleccionarVehiculo()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                backgroundColor: const Color(0xFF87CEEB),
              ),
              child: const Text(
                'Vehículo',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 330,
                  height: 50,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Hora ha sido presionado!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Hora()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(160, 40),
                          padding: const EdgeInsets.all(10.0),
                          backgroundColor: const Color(0xFF87CEEB),
                        ),
                        child: const Text(
                          'Hora',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF003DA6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          print('Edificio ha sido presionado!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Edificio()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(160, 40),
                          padding: const EdgeInsets.all(10.0),
                          backgroundColor: const Color(0xFF87CEEB),
                        ),
                        child: const Text(
                          'Edificio',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF003DA6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 320,
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                print('Reservar ha sido presionado!');
                print(widget.horaSel);
                print(widget.ediSel);
                print(widget.vehSel);
                print(widget.sedeSel);
                print('Reservar ha sido presionado!');
                /*_showReservarBottomSheet(
                  context,
                  widget.horaSel!,
                  widget.ediSel!,
                  widget.vehSel!,
                  widget.sedeSel!,
                );*/
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Reservar',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.qr_code_outlined, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.directions_car, 2),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF003DA6),
        backgroundColor: const Color(0xFF003DA6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _selectedIndex == index ? Colors.white : Colors.transparent,
      ),
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        icon,
        size: 40.0,
        color: _selectedIndex == index ? const Color(0xFF003DA6) : Colors.white,
      ),
    );
  }
}
