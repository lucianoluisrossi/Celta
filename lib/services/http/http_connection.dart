import 'dart:convert';

import 'package:celta/common/constants.dart';
import 'package:celta/common/validate.dart';
import 'package:http/http.dart' as http;

class HttpConnection {
  String? endPointUrl;
  HttpConnection({this.endPointUrl});

  //Este metodo valida si la conexion funciona y devuelve la funcion getData
  getValidate() async {
    return await Validate.connectionError(method: getData);
  }

  /*  loadGet() async {
    var resp = await http.get(Uri.parse(Constants.DOMAIN_API_CELTA));
    return resp.body.toString();
  } */

  getData() async {
    http.Response response = await http.get(Uri.parse(endPointUrl!));
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? response.body.toString()
        : Validate.errorWidget(Constants.SERVER_ERROR,
            content: "${response.statusCode}");
  }
}
