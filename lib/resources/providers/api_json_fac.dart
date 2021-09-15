import 'dart:convert';

import 'package:celta/models/fac.dart';

import 'package:http/http.dart' as http;

class ApiJsonFac {
  final uri = 'http://192.168.0.123/prueba_app/api/comprobantes';

  Future<List<Fac>> getFac() async {
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode != 200) {
      throw Exception('Error al traer los datos');
    } else {
      final data = json.decode(response.body);

      return List<Fac>.from(data.map((fac) {
        return Fac.fromJson(fac);
      }));
    }
  }
}
