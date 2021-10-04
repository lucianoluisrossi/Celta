import 'package:celta/common/constants.dart';
import 'package:celta/services/http/http_connection.dart';

class Endpoint {
  static getSuministro(codSuministro) {
    var endPoint = '${Constants.DOMAIN}suministros/$codSuministro';

    return HttpConnection(endPointUrl: endPoint).getData();
  }
}
