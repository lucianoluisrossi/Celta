import 'package:celta/services/http/http_connection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:celta/models/usuario.dart';

//Estado de autenticación donde se encuentra el usuario
enum AppLoginState {
  loggedOut, //desconectado
  emailAddress, //le pedimos email
  registerFirebaseAccount, //le pedimos registrar cuenta
  password, //le pedimos un password si la cuenta existe
  loggedIn, //logeado
  emailVerified, //ha iniciado sesión
  registeredUser //Usuario registrado
}

class AuthAppState extends ChangeNotifier {
  AppLoginState _loginState =
      AppLoginState.loggedOut; //esta propiedad se inicializa loggedOut
  get loginState => _loginState; //getter para obtener estado de la auth
  String? _email;
  String? get email => _email;

  AuthAppState() {
    initializedFirebase();
  }

/* Inicializa Firebase y se queda escuchando cambios en el usuario
 Condiciona si el usuario esta conectado (no es null) utiliza
 el enum AppLoginState para cambiar la variable _loginState a loggedIn (usuario logueado), sino loggedOut*/
  Future<void> initializedFirebase() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          _loginState = AppLoginState.loggedIn;
          notifyListeners();
        } else {
          _loginState = AppLoginState.emailAddress;
          notifyListeners();
        }
      },
    );
  }

  /* El siguiente metodo verifica que el email exista en Firebase,
  si es así, _loginState = AppLoginState.password
  si no, _loginState = AppLoginState.register */
  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var authMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(
          email); //Pide a firebase una lista de metodos de autenticacion de acuerdo al email.

      if (authMethods.contains('password')) {
        _loginState = AppLoginState.password;
        notifyListeners();
      } else {
        _loginState = AppLoginState.registerFirebaseAccount;
        notifyListeners();
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  //Envia el mail de confirmacion de cuenta de correo

  Future<void> sendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      _loginState = AppLoginState.emailVerified;
      notifyListeners();
    }
  }

//verifica que el usuario haya confirmado el mail
  Future<void> emailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    user?.reload();

    if (user != null && !user.emailVerified) {
      _loginState = AppLoginState.emailVerified;
      user.reload();
      notifyListeners();
    } else {
      user?.reload();

      await buildUsuarioFirestore();
      _loginState = AppLoginState.loggedIn;
      notifyListeners();
    }
    notifyListeners();
  }

//SingIn
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

//Cancel
  void cancelRegistration() {
    _loginState = AppLoginState.emailAddress;
    notifyListeners();
  }

//Register account in FireBaseAuth
//Registra con email and Password y actualiza displayName con la variable nombre
//Ejecuta sendVerificationEmail(), que envia el mail de verificacion y setea AppLoginState.emailVerified
  Future<void> registerAccount(String email, String password, String nombre,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email, password: password); //crea usuario de firebaseAuth
      User? user = result.user;
      user!.updateDisplayName(nombre);
      sendVerificationEmail();

      //await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

//SignOut
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _loginState = AppLoginState.emailAddress;
    notifyListeners();
  }

//Registro de datos de Usuario en FireStore
  Future<void> buildUsuarioFirestore() async {
//Instancio usuario actual de FirebaseAuth
    FirebaseAuth _auth = FirebaseAuth.instance;

//Instancio FireStore
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    User? userAuth = _auth.currentUser;

//Instancio model Usuario
    Usuario usuario = Usuario();

//Writing values in FireStore
    usuario.email = userAuth!.email;
    usuario.uid = userAuth.uid;
    usuario.nombre = userAuth.displayName;

    await _fireStore
        .collection('usuarios')
        .doc(userAuth.uid) //Agrega documento uid (extraido de FireBase auth)
        .set(usuario.toFireStore());
    //_loginState = AppLoginState.loggedIn;
    notifyListeners();
  }

  /*  Future<void> addSuministroFireStore(String suministro) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;

    Future<dynamic> _getSumin = HttpConnection().getData(suministro);

    //TODO: continuar 1  --  if(_getSumin)
  } */
}
