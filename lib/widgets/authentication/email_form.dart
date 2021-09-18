import 'package:celta/src/widgets/fondo_celta.dart';
import 'package:celta/widgets/authentication/auth_button.dart';
import 'package:celta/widgets/authentication/auth_text_field.dart';

import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  EmailForm(
      {this.alignmentForm,
      this.formHeight,
      this.formWidth,
      required this.callback});

  final AlignmentGeometry? alignmentForm;
  final double? formWidth;
  final double? formHeight;
  final void Function(String email) callback;

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  //final user = UserProvider();

  final _mailController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_emailForm');

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FondoCelta(),
      Center(
        child: SingleChildScrollView(
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
                    color: Colors.black,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 5.0))
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Ingrese un Email para continuar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  AuthTextField(
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Ingrese un email válido para continuar';
                      }
                      return null;
                    },
                    fieldIcon: Icons.mail,
                    hint: 'Ingrese un Email válido',
                    label: 'Email',
                    textColor: Colors.green,
                    hideText: false,
                    onChange: (value) {},
                    textController: _mailController,
                    inputType: TextInputType.emailAddress,
                  ),
                  AuthButton(
                      label: 'Siguiente',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          widget.callback(_mailController.text);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
