import 'dart:convert';

import 'package:celta/common/constants.dart';
import 'package:celta/common/validate.dart';
import 'package:http/http.dart' as http;

class HttpConnection {
  String? endPointUrl;
  HttpConnection({this.endPointUrl});

  get() async {
    return await Validate.connectionError(method: loadGet);
  }

  loadGet() async {
    var resp = await http.get(Uri.parse(Constants.DOMAIN));
    return resp.body.toString();
  }

  getData() async {
    http.Response response = await http.get(Uri.parse(endPointUrl!));

    return (response.statusCode == 200)
        ? response.body.toString()
        : Validate.errorWidget(Constants.SERVER_ERROR,
            content: "${response.statusCode}");
  }
}
