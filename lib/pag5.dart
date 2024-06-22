// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print, use_super_parameters
import 'package:flutter/material.dart';
import 'package:pum/pag12.dart';
import 'package:pum/pag8b.dart';
import 'package:pum/pag9.dart';
import 'pag6.dart';
import 'pag7b.dart';
import 'pag8.dart';
import 'pag7.dart';
import 'pag10.dart';
//import 'pag12.dart';

void _showReservarBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const ConfirmacionReserva();
    },
    isScrollControlled: true,
  );
}

class Index extends StatelessWidget {
  final String selectedBuildingDescription; 
  final NavigationData navigationData;

  const Index({
    required this.selectedBuildingDescription,
    required this.navigationData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MyHomePage(),
        '/pag12': (context) => IndexSeguridad(),
        '/pag10': (context) => const QRScannerPage(),
        '/pag7': (context) => RegistroVehiculo(),
        '/seleccionarVehiculo': (context) => SeleccionarVehiculo(),
        '/hora': (context) => const Hora(),
        '/edificio': (context) => Edificio(),
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    MyHomePageContent(),
    const QRScannerPage(),
    RegistroVehiculo(),
  ];

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
                print('Imagen presionada');
                Navigator.pushNamed(context, '/');
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
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
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

class MyHomePageContent extends StatelessWidget {
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
              Navigator.pushNamed(context, '/seleccionarVehiculo');
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
                        Navigator.pushNamed(context, '/hora');
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
                        Navigator.pushNamed(context, '/edificio');
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
              color: Color(0xFFD9D9D9),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              print('Reservar ha sido presionado!');
              _showReservarBottomSheet(context);
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
