import 'package:celta/common/constants.dart';
import 'package:celta/services/http/http_connection.dart';

class Endpoint {
  //El siguiente metodo obtiene el doc suministro enviandole codSuministro, y retorna el metodo getData de class HttpConnection
  getSuministro(codSuministro) {
    var endPoint = Constants.DOMAIN_API_CELTA + 'suministros/$codSuministro';
    return HttpConnection(endPointUrl: endPoint).getValidate();
  }
}
