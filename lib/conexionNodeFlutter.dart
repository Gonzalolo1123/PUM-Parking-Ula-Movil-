// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

// Clase modelo para los datos
class DatoTest {
  final String correo;
  final String contrasena;


  DatoTest({
    required this.correo,
    required this.contrasena,
  });

  factory DatoTest.fromJson(Map<String, dynamic> json) {
    return DatoTest(
      correo: json['Correo'],
      contrasena: json['Contraseña'],
    );
  }
}

// Función para obtener los datos desde el servidor
Future<List<DatoTest>> fetchArrayDatosTest() async {
  try {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000'));
    if (response.statusCode == 200) {
      print("Datos obtenidos exitosamente");
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((item) => DatoTest.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar los datos: ${response.statusCode}');
    }
  } catch (e) {
    print('Error de conexión: $e');
    return [];
  }
}
