import 'package:celta/models/fac.dart';
import 'package:celta/services/firebase/auth_app_state.dart';
import 'package:flutter/material.dart';

class FacWidget extends StatelessWidget {
  final Fac? fac;
  FacWidget({this.fac});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Center(
            child: Text('Login OK'),
          ),
          MaterialButton(
            onPressed: () {
              AuthAppState().signOut();
            },
            child: Text('Logout'),
          )
        ],

        //children: [Text(fac!.nrocbte!), Text(fac!.fechaEmision.toString())],
      ),
    );
  }
}
