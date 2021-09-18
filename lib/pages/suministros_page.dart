import 'package:celta/src/widgets/fondo_celta.dart';
import 'package:celta/widgets/authentication/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SuministrosPage extends StatefulWidget {
  SuministrosPage({Key? key}) : super(key: key);

  @override
  _SuministrosPageState createState() => _SuministrosPageState();
}

class _SuministrosPageState extends State<SuministrosPage> {
  @override
  Widget build(BuildContext context) {
    String? user = FirebaseAuth.instance.currentUser?.displayName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(user!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text('Suministro 425566 - 17 de agosto Nro 49'),
              ),
              DropdownMenuItem(
                child: Text('Suministro 421589 - Colon Nro 36'),
              ),
            ],
            hint: Text('Suministros'),
            focusColor: Colors.lightGreen,
          ),
          /*  Stack(
            children: [
              FondoCelta(),
            ],
          ), */
        ],
      ),
    );
  }
}
