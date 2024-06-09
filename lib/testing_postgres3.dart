import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http; // PARA CONEXION A BACKEND NODEJS

class Index extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Index({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestingPostgres3(),
    );
  }
}

class TestingPostgres3 extends StatefulWidget {
@override
_TestingPostgres3State createState() => _TestingPostgres3State();
}

class _TestingPostgres3State extends State<TestingPostgres3> {
  List<DatoTest> _ArrayDatosTest = [];
  @override
  void initState() {
    super.initState();
    _fetchArrayDatosTest();
  }
  Future<void> _fetchArrayDatosTest() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/FormTest/FormTestDatos'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      setState(() {
      _ArrayDatosTest = json.map((item) => DatoTest.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load ArrayDatosTest');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArrayDatosTest'),
      ),
      body: ListView.builder(
        itemCount: _ArrayDatosTest.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_ArrayDatosTest[index].nombreFormTest),
            subtitle: Text(_ArrayDatosTest[index].carreraFormTest),
          );
        },
      ),
    );
  }
 }


class DatoTest {
  final int id;
  final String nombreFormTest;
  final String carreraFormTest;
  final String actividadTest;
  final int horasActividadTest;

  DatoTest({required this.id, required this.nombreFormTest, required this.carreraFormTest, required this.actividadTest, required this.horasActividadTest});

  factory DatoTest.fromJson(Map<String, dynamic> json) {
    return DatoTest(
      id: json['id'],
      nombreFormTest: json['nombreFormTest'],
      carreraFormTest: json['carreraFormTest'],
      actividadTest: json['actividadTest'],
      horasActividadTest: json['horasActividadTest'],
    );
  }
}
