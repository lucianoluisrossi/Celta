import 'dart:convert';

import 'package:celta/common/constants.dart';
import 'package:celta/common/show_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';

typedef void VoidCallBackParam(Map parameters);

class Validate {
  var dataType;
  //creo el metodo (tipo Widget) errorWidget
  static Widget? errorWidget(String error, {String content = ""}) {
    switch (error) {
      case Constants.CONNECTION_DISABLED:
        return ShowDialog(title: 'Error en la Conexión. $content');

      case Constants.WIFI_DISABLED:
        return ShowDialog(
            title: 'WiFi desactivado, por favor active. $content');

      case Constants.SERVER_ERROR:
        return ShowDialog(title: 'Error en el servidor. $content');

      case Constants.MESSAGE:
        return ShowDialog(title: content);
    }
  }

  //validacion mapa vacio, si en parameters.toString recibo "[]", envio null (quiero decir que esta vacio), sino envio los parametros
  static emptyMap(parameters) {
    return parameters.toString() == "[]" ? null : parameters;
  }

  //Metodo para probar conexion
  static connectionError(
      {VoidCallback? method,
      VoidCallBackParam? methodParam,
      Map? parameters}) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      //consulta si hay algun tipo de conexion del telefono (none de ningun tipo)
      return errorWidget(Constants.CONNECTION_DISABLED);
    } else {
      return (emptyMap(parameters) != null)
          ? methodParam!(parameters!)
          : method!();
    }
  }

//valida si HttpConnection.getData devuelve un widget de error o json
  isWidget(VoidCallBackParam method) {
    return (dataType is Widget)
        ? dataType
        : dataType.isNotEmpty
            ? method(json.decode(dataType))
            : null;
  }
}
