// ignore_for_file: avoid_print, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, deprecated_member_use, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_element, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pum/estacionamientoAV.dart';
import 'package:pum/estacionamientoCentral.dart';
import 'package:pum/estacionamientoMeyer.dart';
import 'package:pum/pag14.dart';

import 'package:http/http.dart' as http;

import 'pag10.dart'; // Importa tus páginas aquí
import 'pag6.dart';
import 'pag7.dart';
import 'pag7b.dart';
import 'pag8.dart';
import 'pag9.dart';
import 'reporteGuardia.dart';

void _showReservarBottomSheet(
    BuildContext context,
    String horaentradaSel,
    String horasalidaSel,
    String ediSel,
    String vehSel,
    String idEspacioSel,
    String sedeSel,
    String usuarioId) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ConfirmacionReserva(
          HoraEntradaSel: horaentradaSel,
          EdiSel: ediSel,
          VehSel: vehSel,
          idEspacioSel: idEspacioSel,
          HoraSalidaSel: horasalidaSel,
          SedeSel: sedeSel,
          UsuarioId: usuarioId);
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? horaentradaSel;
  final String? horasalidaSel;
  final String? ediSel;
  final String? vehSel;
  final String? idEspacioSel;
  final String? sedesel;
  final String? usuarioId;

  MyHomePage({
    this.horaentradaSel,
    this.horasalidaSel,
    this.ediSel,
    this.vehSel,
    this.idEspacioSel,
    this.sedesel,
    super.key,
    this.usuarioId,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _horaentradaSel;
  String? _horasalidaSel;
  String? _ediSel;
  String? _vehSel;
  String? _idEspacioSel;
  String? _sedesel;
  String? _usuarioId;
  @override
  void initState() {
    super.initState();
    _horaentradaSel = widget.horaentradaSel;
    _horasalidaSel = widget.horasalidaSel;
    _ediSel = widget.ediSel;
    _vehSel = widget.vehSel;
    _idEspacioSel = widget.idEspacioSel;
    _sedesel = widget.sedesel;
    _selectedIndex = 0;
    _usuarioId = widget.usuarioId;
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
            horaentradaSel: _horaentradaSel,
            horasalidaSel: _horasalidaSel,
            ediSel: _ediSel,
            vehSel: _vehSel,
            idEspacioSel: _idEspacioSel,
            sedesel: _sedesel,
            usuarioId: _usuarioId,
            onVehiculoSelected: (nuevoVehiculo) {
              setState(() {
                _vehSel = nuevoVehiculo;
              });
            },
            onHoraentradaSelected: (nuevaHora) {
              setState(() {
                _horaentradaSel = nuevaHora;
              });
            },
            onHorasalidaSelected: (nuevaHora) {
              setState(() {
                _horasalidaSel = nuevaHora;
              });
            },
            onEdificioSelected: (nuevoEdificio) {
              setState(() {
                _ediSel = nuevoEdificio;
              });
            },
            onIdEspacioSelected: (nuevaIdEspacio) {
              setState(() {
                _idEspacioSel = nuevaIdEspacio;
              });
            },
            onSedeSelected: (nuevaSede) {
              setState(() {
                _sedesel = nuevaSede;
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
  Future<void> _selectReserva(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://website-parking-ulagos.onrender.com/usuarios/selectReserva?usuarioId=${usuarioId!}'), // Endpoint correcto para selectReserva
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parsear la respuesta JSON
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey('reserva')) {
          // Mostrar mensaje o realizar acciones según la respuesta
          print('Reserva encontrada');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReservaCompletada(usuarioId!)),
          );
          return;
        } else {
          // Mostrar mensaje de error si no se encontró 'reserva' en la respuesta
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No se encontró reserva')),
          );
        }
      } else if (response.statusCode == 404) {
        // Mostrar mensaje de error si no se encontró 'reserva' en la respuesta
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se encontró reserva')),
        );
      } else {
        // Mostrar mensaje de error si la solicitud falla
        print('Error al obtener la reserva: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al obtener la reserva')),
        );
      }
    } catch (e) {
      // Mostrar mensaje de error si hay un problema de conexión
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  final String? horaentradaSel;
  final String? horasalidaSel;
  final String? ediSel;
  final String? vehSel;
  final String? idEspacioSel;
  final String? sedesel;
  final String? usuarioId;
  final ValueChanged<String>? onVehiculoSelected;
  final ValueChanged<String>? onHoraentradaSelected;
  final ValueChanged<String>? onHorasalidaSelected;
  final ValueChanged<String>? onEdificioSelected;
  final ValueChanged<String>? onIdEspacioSelected;
  final ValueChanged<String>? onSedeSelected;

  const MyHomePageContent({
    super.key,
    this.horaentradaSel,
    this.horasalidaSel,
    this.ediSel,
    this.vehSel,
    this.idEspacioSel,
    this.sedesel,
    this.onVehiculoSelected,
    this.onHoraentradaSelected,
    this.onHorasalidaSelected,
    this.onEdificioSelected,
    this.onIdEspacioSelected,
    this.onSedeSelected,
    this.usuarioId,
  });

  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox(height: 10), // Espacio entre el ícono y el texto
        Center(
          child: Text(
            'Completa los campos para la reserva',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25, // Tamaño del texto aumentado
              color: Color(0xFF003DA6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('¡Vehículo ha sido presionado!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeleccionarVehiculo(usuarioId)),
                    ).then((nuevoVehiculo) {
                      if (nuevoVehiculo != null) {
                        onVehiculoSelected?.call(nuevoVehiculo);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40), // Tamaño mínimo del botón
                    padding: EdgeInsets.all(10.0),
                    backgroundColor: Color(0xFF87CEEB),
                  ),
                  child: Icon(
                    Icons.directions_car,
                    color: Color(0xFF003DA6),
                    size: 30,
                  ),
                ),

                SizedBox(height: 10), // Espacio entre el ícono y el texto
                Text(
                  'Vehículo',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Edificio ha sido presionado!');
                    print(sedesel);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edificio(sede: sedesel!)),
                    ).then((nuevoEdificio) {
                      if (nuevoEdificio != null) {
                        onEdificioSelected?.call(nuevoEdificio);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40), // Tamaño mínimo del botón
                    padding: EdgeInsets.all(10.0),
                    backgroundColor: Color(0xFF87CEEB),
                  ),
                  child: Icon(
                    Icons.business,
                    color: Color(0xFF003DA6),
                    size: 30,
                  ),
                ),

                SizedBox(height: 10), // Espacio entre el ícono y el texto
                Text(
                  'Edificio',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Hora ha sido presionado!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hora()),
                    ).then((hora) {
                      if (hora != null) {
                        onHoraentradaSelected?.call(hora['entrada']);
                        onHorasalidaSelected?.call(hora['salida']);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40), // Tamaño mínimo del botón
                    padding: EdgeInsets.all(10.0),
                    backgroundColor: Color(0xFF87CEEB),
                  ),
                  child: Icon(
                    Icons.access_time,
                    color: Color(0xFF003DA6),
                    size: 30,
                  ),
                ),
                SizedBox(height: 10), // Espacio entre el ícono y el texto
                Text(
                  'Hora',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print('Estacionamiento ha sido presionado!');
                Widget destino = Container(); // Valor predeterminado

                if (ediSel == 'Principal') {
                  destino = EstacionamientoMeyer();
                } else if (ediSel == 'Central') {
                  destino = EstacionamientoCentral();
                } else if (ediSel == 'Pedagogia' ||
                    ediSel == 'Aulas Virtuales' ||
                    ediSel == 'ITR') {
                  destino = EstacionamientoAV();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'El edificio no fue seleccionado, por favor seleccione uno')),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destino),
                ).then((nuevaIdEspacio) {
                  if (nuevaIdEspacio != null) {
                    onIdEspacioSelected?.call(nuevaIdEspacio);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10.0),
                backgroundColor: Color(0xFF87CEEB),
              ),
              child: Icon(
                Icons.local_parking_rounded,
                color: Color(0xFF003DA6),
                size: 30,
              ),
            ),

            SizedBox(height: 10), // Espacio entre el ícono y el texto
            Text(
              'Estacionamientos',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF003DA6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            print('Reservar presionado');
            if (horaentradaSel != null &&
                horasalidaSel != null &&
                ediSel != null &&
                vehSel != null &&
                idEspacioSel != null) {
              _showReservarBottomSheet(context, horaentradaSel!, horasalidaSel!,
                  ediSel!, vehSel!, idEspacioSel!, sedesel!, usuarioId!);
            } else {
              print('Faltan datos para la reserva');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Faltan datos para la reserva')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(320, 40),
            padding: EdgeInsets.all(10.0),
            side: BorderSide(width: 2, color: Color(0xFF003DA6)),
          ),
          child: Text(
            'Reservar',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF003DA6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10.0),
        //////////////////////////////////////////////////
        Text(
          'Datos de mi reserva',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFF003DA6),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Reportes ha sido presionado!');
                    // Aquí puedes navegar a la pantalla de reportes cuando esté lista
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportesUsuario(usuarioId!)));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10.0),
                    backgroundColor: Color(0xFF87CEEB),
                  ),
                  child: Icon(
                    Icons.description,
                    color: Color(0xFF003DA6),
                    size: 30,
                  ),
                ),
                SizedBox(height: 10), // Espacio entre el ícono y el texto
                Text(
                  'Reportes',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Reserva de Estacionamiento ha sido presionado!');
                    // Aquí puedes navegar a la pantalla de mi reserva
                    _selectReserva(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10.0),
                    backgroundColor: Color(0xFF87CEEB),
                  ),
                  child: Icon(
                    Icons.directions_bus,
                    color: Color(0xFF003DA6),
                    size: 30,
                  ),
                ),
                SizedBox(height: 10), // Espacio entre el ícono y el texto
                Text(
                  'Mi reserva',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003DA6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
