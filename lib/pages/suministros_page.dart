import 'package:celta/src/widgets/fondo_celta.dart';
import 'package:celta/widgets/authentication/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SuministrosPage extends StatefulWidget {
  //SuministrosPage({Key? key}) : super(key: key);

  @override
  _SuministrosPageState createState() => _SuministrosPageState();
}

class _SuministrosPageState extends State<SuministrosPage> {
  @override
  Widget build(BuildContext context) {
    String? user = FirebaseAuth.instance.currentUser?.displayName;
    List<String> suministros = [
      '4566985 - 17 de agosto 49',
      '489556 - Rauch 850'
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(color: Colors.green),
            child: DropdownButton(
              items: suministros
                  .map((String e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (_value) {
                setState(() {
                  //TODO: cambiar vista de suministros
                });
              },
              hint: Text('Suministros'),
            ),
          ),
        ],
      ),
    );
  }
}
