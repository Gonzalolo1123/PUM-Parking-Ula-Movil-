// ignore_for_file: avoid_print, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'pag10.dart'; // Importa tus páginas aquí
import 'pag12.dart';
import 'pag6.dart';
import 'pag7.dart';
import 'pag7b.dart';
import 'pag8.dart';
import 'pag9.dart';

void _showReservarBottomSheet(BuildContext context, String horaSel,
    String ediSel, String vehSel, String sedeSel) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ConfirmacionReserva(
          HoraSel: horaSel, EdiSel: ediSel, VehSel: vehSel, SedeSel: sedeSel);
    },
    isScrollControlled: true,
  );
}

class Index extends StatelessWidget {
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/': (context) => MyHomePage(),
        '/pag12': (context) => IndexSeguridad(),
        '/pag10': (context) => const QRScannerPage(),
        '/pag7': (context) => RegistroVehiculo(),
        '/seleccionarVehiculo': (context) => SeleccionarVehiculo(),
        '/hora': (context) => const Hora(),
        '/edificio': (context) => Edificio(),
      },
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
  String? _horaSel;
  String? _ediSel;
  String? _vehSel;
  String? _sedeSel;

  @override
  void initState() {
    super.initState();
    _horaSel = widget.horaSel;
    _ediSel = widget.ediSel;
    _vehSel = widget.vehSel;
    _sedeSel = widget.sedeSel;
    _selectedIndex = 0;
  }
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MyHomePageContent(
            horaSel: _horaSel,
            ediSel: _ediSel,
            vehSel: _vehSel,
            sedeSel: _sedeSel,
            onVehiculoSelected: (nuevoVehiculo) {
              setState(() {
                _vehSel = nuevoVehiculo;
              });
            },
            onHoraSelected: (nuevaHora) {
              setState(() {
                _horaSel = nuevaHora;
              });
            },
            onEdificioSelected: (nuevoEdificio) {
              setState(() {
                _ediSel = nuevoEdificio;
              });
            },
            onSedeSelected: (nuevaSede) {
              setState(() {
                _sedeSel = nuevaSede;
              });
            },
          ),
          const QRScannerPage(),
          RegistroVehiculo(),
        ],
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
      padding: const EdgeInsets.all(5.0), // Espacio alrededor del icono
      child: Icon(
        icon,
        size: 40.0,
        color: _selectedIndex == index ? const Color(0xFF003DA6) : Colors.white,
      ),
    );
  }
}
class MyHomePageContent extends StatelessWidget {
  final String? horaSel;
  final String? ediSel;
  final String? vehSel;
  final String? sedeSel;
  final ValueChanged<String>? onVehiculoSelected;
  final ValueChanged<String>? onHoraSelected;
  final ValueChanged<String>? onEdificioSelected;
  final ValueChanged<String>? onSedeSelected;

  const MyHomePageContent({
    Key? key,
    this.horaSel,
    this.ediSel,
    this.vehSel,
    this.sedeSel,
    this.onVehiculoSelected,
    this.onHoraSelected,
    this.onEdificioSelected,
    this.onSedeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              print('¡Vehículo ha sido presionado!');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeleccionarVehiculo()),
              ).then((nuevoVehiculo) {
                if (nuevoVehiculo != null) {
                  onVehiculoSelected?.call(nuevoVehiculo);
                }
              });
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
          const SizedBox(
            height: 10.0,
          ),
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
                          MaterialPageRoute(builder: (context) => const Hora()),
                        ).then((nuevaHora) {
                          if (nuevaHora != null) {
                            onHoraSelected?.call(nuevaHora);
                          }
                        });
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
                    const SizedBox(width: 10.0), // Espacio entre los botones
                    ElevatedButton(
                      onPressed: () {
                        print('Edificio ha sido presionado!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Edificio()),
                        ).then((nuevoEdificio) {
                          if (nuevoEdificio != null) {
                            onEdificioSelected?.call(nuevoEdificio);
                          }
                        });
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
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: 320,
            height: 250,
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9), // Color de fondo
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              
              print('---------------------Inicio Muestra------------------');
              print(horaSel);
              print(ediSel);
              print(vehSel);
              print(sedeSel);

              print('---------------------Cierre Muestra------------------');
              print('Reservar presionado');
              if (horaSel != null &&
                  ediSel != null &&
                  vehSel != null &&
                  sedeSel != null) {
                _showReservarBottomSheet(
                    context, horaSel!, ediSel!, vehSel!, sedeSel!);
              } else {
                print('Faltan datos para la reserva');
              }
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
    );
  }
}
