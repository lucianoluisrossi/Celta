import 'package:celta/pages/fac_page.dart';
import 'package:celta/pages/suministros_page.dart';
import 'package:celta/services/firebase/auth_app_state.dart';

import 'package:celta/widgets/authentication/email_form.dart';
import 'package:celta/widgets/authentication/email_verified_form.dart';
import 'package:celta/widgets/authentication/password_form.dart';
import 'package:celta/widgets/authentication/register_form.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication extends StatelessWidget {
  FirebaseAuthentication({
    this.cancelRegistration,
    this.email,
    this.loginState,
    this.registerAccount,
    this.signInWithEmailAndPassword,
    this.signOut,
    this.verifyEmail,
    required this.emailVerified,
    this.registerUser,
  });

  final AppLoginState? loginState;
  final String? email;

  final void Function(
    String email,
    void Function(Exception e) error,
  )? verifyEmail;

  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  )? signInWithEmailAndPassword;

  final void Function()? cancelRegistration;

  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  )? registerAccount;

  final void Function()? signOut;

  final void Function() emailVerified;

  final void Function(
    String nombre,
    //String displayName,
    String codUsuario,
    void Function(Exception e) error,
  )? registerUser;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case AppLoginState.emailAddress:
        return EmailForm(
          callback: (email) => verifyEmail!(
              email, (e) => _showErrorDialog(context, 'Email inválido', e)),
        );

      case AppLoginState.password:
        return PasswordForm(
          email: email,
        );
      case AppLoginState.registerFirebaseAccount:
        return RegisterFirebaseAuthForm(
          email: email!,
          cancel: () {
            cancelRegistration!();
          },
          registerAccount: (email, password, nombre) {
            registerAccount!(
              email,
              password,
              nombre,
              (e) => _showErrorDialog(context, 'Error al crear la cuenta', e),
            );
          },
          emailVerified: emailVerified,
        );
      case AppLoginState.emailVerified:
        return EmailVerifiedForm(
          verifiedEmail: emailVerified,
        );
      case AppLoginState.loggedIn:
        return SuministrosPage();

      case AppLoginState.registeredUser:
        return FacPage();
      default:
        return EmailForm(
          callback: (email) => verifyEmail!(
            email,
            (e) => _showErrorDialog(context, 'Email inválido', e),
          ),
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
