class Fac {
  Fac({
    this.nrocbte,
    this.fechaEmision,
    this.tipoCbte,
  });

  factory Fac.fromJson(Map<String, dynamic> json) => Fac(
        nrocbte: json["NROCBTE"],
        fechaEmision: DateTime.parse(json["FECHA_EMISION"]),
        tipoCbte: json["TIPO_CBTE"],
      );

  DateTime? fechaEmision;
  String? nrocbte;
  String? tipoCbte;

  Map<String, dynamic> toJson() => {
        "NROCBTE": nrocbte,
        "FECHA_EMISION":
            "${fechaEmision!.year.toString().padLeft(4, '0')}-${fechaEmision!.month.toString().padLeft(2, '0')}-${fechaEmision!.day.toString().padLeft(2, '0')}",
        "TIPO_CBTE": tipoCbte,
      };
}
