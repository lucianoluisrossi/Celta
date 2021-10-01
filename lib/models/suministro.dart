import 'dart:convert';

Suministro suministroFromJson(String str) =>
    Suministro.fromJson(json.decode(str));

String suministroToJson(Suministro data) => json.encode(data.toJson());

class Suministro {
  Suministro({
    this.suministro,
    this.servicio,
    this.idcategoria,
    this.ruta,
    this.idcliente,
    required this.fechaAlta,
    this.idstatus,
  });

  final String? suministro;
  final String? servicio;
  final String? idcategoria;
  final int? ruta;
  final int? idcliente;
  final DateTime fechaAlta;
  final int? idstatus;

  factory Suministro.fromJson(Map<String, dynamic> json) => Suministro(
        suministro: json["suministro"],
        servicio: json["servicio"],
        idcategoria: json["idcategoria"],
        ruta: json["ruta"],
        idcliente: json["idcliente"],
        fechaAlta: DateTime.parse(json["fecha_alta"]),
        idstatus: json["idstatus"],
      );

  Map<String, dynamic> toJson() => {
        "suministro": suministro,
        "servicio": servicio,
        "idcategoria": idcategoria,
        "ruta": ruta,
        "idcliente": idcliente,
        "fecha_alta": fechaAlta.toIso8601String(),
        "idstatus": idstatus,
      };
}
