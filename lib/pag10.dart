// ignore_for_file: library_private_types_in_public_api, use_super_parameters, unused_element, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pum/pag11.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

import 'pag14.dart';

void _showReservarBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const CodigoManual();
    },
    isScrollControlled: true,
  );
}

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({Key? key}) : super(key: key);

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String qrValue = "Código QR";

  @override
  void initState() {
    super.initState();
    _initScanner(); // Call _initScanner() to request camera permissions
  }

  Future<void> _initScanner() async {
    await _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      setState(() {
        qrValue = "Permiso de cámara denegado";
      });
    } else if (status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> _scanQr() async {
    try {
      String? cameraScanResult = await scanner.scan();
      if (cameraScanResult != null) {
        setState(() {
          qrValue = cameraScanResult;
        });
        await registrarReserva(context, cameraScanResult);
      }
    } catch (e) {
      setState(() {
        qrValue = "Error al escanear el QR: $e";
      });
      print("Error al escanear el QR: $e");
    }
  }

  Future<void> registrarReserva(BuildContext context, String qrData) async {
    try {
      // Parse QR data (assuming JSON format)
      Map<String, dynamic> qrInfo = jsonDecode(qrData);

      // Retrieve license plate from the app
      String patente = "ABC123"; // Replace with the actual license plate data from your app

      // Add the current time as 'hora_entrada'
      qrInfo['hora_entrada'] = DateTime.now().toIso8601String();
      qrInfo['patente'] = patente;

      final response = await http.post(
        Uri.parse('https://website-parking-ulagos.onrender.com/usuarios/reserva'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(qrInfo),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reserva registrada exitosamente')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReservaCompletada()),
        );
      } else if (response.statusCode == 121) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ya tienes una reserva')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReservaCompletada()),
        );
        print(response.statusCode);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión o formato de QR incorrecto')),
      );
      print('Error de conexión o formato de QR incorrecto: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _scanQr,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20), // Ajusta el padding según el tamaño deseado
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 200, // Tamaño del icono
                color: Color(0xFF003DA6),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showReservarBottomSheet(context);
              },
              child: const Text(
                'Ingresar Manualmente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(130, 0, 0, 0),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(130, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
