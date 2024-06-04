// ignore_for_file: library_private_types_in_public_api, use_super_parameters, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

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
    }
  }

  Future<void> _scanQr() async {
    String? cameraScanResult = await scanner.scan();
    if (cameraScanResult != null) {
      setState(() {
        qrValue = cameraScanResult;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Resultado del escaneo: $qrValue',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQr,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 40),
                padding: const EdgeInsets.all(10.0),
                side: const BorderSide(width: 2, color: Color(0xFF003DA6)),
              ),
              child: const Text(
                'Scannear QR',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF003DA6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                print("Manual");
                // Función que se ejecuta cuando se presiona el botón
                /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogInGuest()),
              );*/
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
              ),
              child: const Text(
                'Ingresar Manualmente',
                style: TextStyle(
                  fontSize: 15,
                  // Ajusta el tamaño de fuente según tus necesidades
                  color: Color.fromARGB(255, 152, 152, 152), // Color del texto
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
