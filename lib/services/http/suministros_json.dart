import 'dart:convert';

import 'package:http/http.dart' as http;

class SuministrosJson {
  Future getData(String suministro) async {
    http.Response response = await http
        .get(Uri.parse('http://192.168.0.30:3000/SUMINISTRO/$suministro'));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
