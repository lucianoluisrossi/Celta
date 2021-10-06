import 'package:celta/services/firebase/auth_app_state.dart';
import 'package:celta/widgets/dialogs/custom_dialog_box.dart';

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
    final mediaQuery = MediaQuery.of(context).size;
    final _codSuministroController = TextEditingController();

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
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Administre sus Servicios',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Bienvenido $user, desde aqui podrá administrar sus suministros',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: mediaQuery.height * 0.1,
            width: mediaQuery.width,
            decoration: BoxDecoration(color: Colors.green),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
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
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: IconButton(
                            //TODO: NO FUNCIONA!!!
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox(
                                      title: 'Nuevo Suministro',
                                      buttonUpText: 'Agregar',
                                      buttonDownText: 'Salir',
                                      descriptions:
                                          'Ingrese un código de Suministro para administrar',
                                      onPressUp: () {
                                        AuthAppState().addSuministroToFireStore(
                                            _codSuministroController.text);
                                      },
                                      onPressDown: () {
                                        Navigator.of(context).pop();
                                      },
                                      textFieldColor: Colors.green,
                                      textFieldController:
                                          _codSuministroController,
                                      textFieldHideText: false,
                                      textFieldHint:
                                          'Ingrese un Suministro Válido',
                                      textFieldIcon: Icons.home_work_rounded,
                                      textFieldInputType: TextInputType.number,
                                      textFieldLabel: 'Código de Suministro',
                                      textFieldOnChange: () {},
                                      textFieldValidate: null,
                                    );
                                  });
                            },
                            icon: Icon(Icons.add_circle_outline_rounded)))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
