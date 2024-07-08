// ignore_for_file: library_private_types_in_public_api, use_super_parameters, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:pum/pag11.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Resultado del escaneo: $qrValue',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 200),
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
            GestureDetector(
              onTap: () {
                // Agrega la lógica para el botón de Registro
                _showReservarBottomSheet(context);
              },
              child: const Text(
                'Ingresar Manualmente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
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
