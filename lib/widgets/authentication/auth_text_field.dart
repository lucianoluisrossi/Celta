import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  AuthTextField(
      {this.fieldIcon,
      this.hint,
      this.label,
      this.textColor,
      this.hideText,
      this.onChange,
      this.textController,
      this.validate,
      this.inputType});

  final IconData? fieldIcon;
  final String? hint;
  final String? label;
  final Color? textColor;
  final bool? hideText;
  final Function(String)? onChange;
  final TextEditingController? textController;
  final String? Function(String?)? validate;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17.0),
      child: TextFormField(
        validator: validate,
        controller: textController,
        onChanged: onChange,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.green[600]),
          hintText: hint,
          icon: Icon(
            fieldIcon,
            color: Colors.green[600],
          ),
        ),
        obscureText: hideText!,
      ),
    );
  }
}
