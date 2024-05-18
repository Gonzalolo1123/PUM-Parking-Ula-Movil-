import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistroVehiculo(),
    );
  }
}

class RegistroVehiculo extends StatefulWidget {
  @override
  _RegistroVehiculoState createState() => _RegistroVehiculoState();
}

class _RegistroVehiculoState extends State<RegistroVehiculo> {
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
                  'Registro Vehículo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
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
                      labelText: 'Apellido',
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
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Correo',
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
                SizedBox(
                  width: 300, // Ajusta el ancho según tus necesidades
                  height: 40, // Ajusta el alto según tus necesidades
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirmar Contraseña',
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
                    backgroundColor: const Color(0xFF87CEEB),
                  ),
                  child: const Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize:
                          20, // Ajusta el tamaño de fuente según tus necesidades
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
                    const SizedBox(width: 5), // Espacio entre los textos
                    GestureDetector(
                      onTap: () {
                        print('iniciar sesión click');
                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LogIn()),
                        );
                        */
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
      padding: const EdgeInsets.all(5.0), // Espacio alrededor del icono
      child: Icon(
        icon,
        size: 40.0,
        color: _selectedIndex == index ? const Color(0xFF003DA6) : Colors.white,
      ),
    );
  }
}
