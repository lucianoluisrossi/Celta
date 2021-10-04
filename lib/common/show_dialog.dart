import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  ShowDialog({required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: actions,
      elevation: 10.5,
    );
  }
}
