import 'package:flutter/material.dart';

class FondoCelta extends StatelessWidget {
  final gradient = Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1),
            colors: [
          Color.fromRGBO(255, 255, 255, 1),
          Color.fromRGBO(0, 150, 20, 0.9),
        ])),
  );

  final pinos = Container(
    margin: EdgeInsets.all(30),
    alignment: Alignment.bottomRight,
    width: 120.0,
    height: 120.0,
    decoration: BoxDecoration(
      backgroundBlendMode: BlendMode.softLight,
      image: DecorationImage(
        image: AssetImage('assets/images/logo-celtacoop.png'),
        fit: BoxFit.contain,
      ),
      color: Colors.grey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        gradient,
        pinos,
      ],
    ));
  }
}
