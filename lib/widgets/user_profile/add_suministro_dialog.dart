import 'package:flutter/material.dart';

class AddSuministroDialog extends StatelessWidget {
  AddSuministroDialog({required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text('Ingrese Código de Suministro'),
          TextFormField(),
          MaterialButton(child: Text('Agregar'), onPressed: () {})
        ],
      ),
      actions: actions,
      elevation: 10.5,
    );
  }
}
