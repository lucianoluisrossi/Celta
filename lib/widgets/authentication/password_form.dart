import 'package:celta/services/firebase/auth_app_state.dart';
import 'package:celta/widgets/authentication/auth_button.dart';
import 'package:celta/widgets/authentication/auth_text_field.dart';

import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  PasswordForm({
    this.alignmentForm,
    this.formHeight,
    this.formWidth,
    required this.email,
  });

  final AlignmentGeometry? alignmentForm;
  final double? formWidth;
  final double? formHeight;
  final String? email;
  //final void Function(String email, String password)? login;

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        alignment: widget.alignmentForm,
        width: widget.formWidth,
        height: widget.formHeight,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        decoration: BoxDecoration(
          //backgroundBlendMode: BlendMode.clear,
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 10.0, offset: Offset(0.0, 5.0))
          ],
        ),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Ingrese su contraseña',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              AuthTextField(
                textController: _passwordController,
                fieldIcon: Icons.lock,
                hint: 'Ingrese un password',
                label: 'Password',
                textColor: Colors.green,
                hideText: true,
                inputType: TextInputType.visiblePassword,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  }
                  return null;
                },
              ),
              AuthButton(
                label: 'Ingresar',
                onPressed: () {
                  AuthAppState().signInWithEmailAndPassword(
                      widget.email!, _passwordController.text, (e) {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
