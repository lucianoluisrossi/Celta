class Usuario {
  String? uid;
  String? nombre;
  String? email;

  Usuario({this.email, this.nombre, this.uid});

//Data from FireStore
  factory Usuario.fromFireStore(data) {
    return Usuario(
        email: data['email'], nombre: data['nombre'], uid: data['uid']);
  }

  //Data to FireStore
  Map<String, dynamic> toFireStore() {
    return {
      'uid': uid,
      'nombre': nombre,
      'email': email,
    };
  }
}
