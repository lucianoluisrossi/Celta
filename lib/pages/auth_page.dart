import 'package:celta/services/firebase/auth_app_state.dart';
import 'package:celta/src/widgets/fondo_celta.dart';
import 'package:celta/widgets/authentication/firebase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final AppLoginState loginState = AppLoginState.loggedOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Celta'),
      ),
      body: Center(
        child: Consumer<AuthAppState>(
          builder: (context, appState, _) => FirebaseAuthentication(
            email: appState.email,
            loginState: appState.loginState,
            verifyEmail: appState.verifyEmail,
            signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
            cancelRegistration: appState.cancelRegistration,
            registerAccount: appState.registerAccount,
            signOut: appState.signOut,
            emailVerified: appState.emailVerified,
          ),
        ),

        /*RegisterForm(
          formHeight: size.height * 0.5,
          formWidth: size.width * 0.90,
        ), */
      ),
    );
  }
}
