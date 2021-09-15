import 'package:celta/widgets/authentication/auth_button.dart';
import 'package:flutter/material.dart';

class EmailVerifiedForm extends StatelessWidget {
  EmailVerifiedForm({
    this.alignmentForm,
    this.formHeight,
    this.formWidth,
    required this.verifiedEmail,
  });
  final AlignmentGeometry? alignmentForm;
  final double? formWidth;
  final double? formHeight;
  final Function() verifiedEmail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: alignmentForm,
        width: formWidth,
        height: formHeight,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Se envio un Email de verificación a su casilla. Ingrese a su cuenta de correo y siga los pasos.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              child: AuthButton(
                label: 'Aceptar',
                onPressed: verifiedEmail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
