import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  AuthButton({required this.label, required this.onPressed});

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 0.5),
        child: Text(label),
      ),
      visualDensity: VisualDensity(horizontal: 1.0, vertical: 2.1),
      splashColor: Colors.green,
      onPressed: onPressed as void Function()?,
      color: Colors.green[900],
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
