class Usuario {
  String? uid;
  String? nombre;
  String? email;
  String? codSuministro;

  Usuario({this.codSuministro, this.email, this.nombre, this.uid});

//Data from FireStore
  factory Usuario.fromFireStore(data) {
    return Usuario(
        codSuministro: data['codSuministro'],
        email: data['email'],
        nombre: data['nombre'],
        uid: data['uid']);
  }

  //Data to FireStore
  Map<String, dynamic> toFireStore() {
    return {
      'uid': uid,
      'nombre': nombre,
      'email': email,
      'codSuministro': codSuministro
    };
  }
}
