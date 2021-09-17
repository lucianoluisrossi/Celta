import 'package:celta/pages/fac_page.dart';
import 'package:celta/services/firebase/auth_app_state.dart';
import 'package:celta/services/http/suministros_json.dart';
import 'package:celta/widgets/authentication/auth_button.dart';
import 'package:celta/widgets/authentication/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserForm extends StatefulWidget {
  const UserForm({
    this.alignmentForm,
    this.formHeight,
    this.formWidth,
  });

//Propiedades de layout
  final AlignmentGeometry? alignmentForm;
  final double? formWidth;
  final double? formHeight;

//Propiedades de usuario

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final SuministrosJson suministro = SuministrosJson();
  final firestoreRegistration = AuthAppState();
  final _nameController = TextEditingController();
  final _codUsuarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: widget.alignmentForm,
        width: widget.formWidth,
        height: widget.formHeight,
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
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Registro de Usuario',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Ingrese sus datos para validar su usuario en Celta.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              AuthTextField(
                fieldIcon: Icons.assignment_ind,
                hint: 'Ingrese su Nombre y Apellido',
                label: 'Nombre y Apellido',
                textColor: Colors.green,
                hideText: false,
                textController: _nameController,
                inputType: TextInputType.name,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese sus datos para continuar';
                  }
                  return null;
                },
              ),
              AuthTextField(
                fieldIcon: Icons.pin,
                hint: 'Ingrese su código de Suministro',
                label: 'Código de Suministro',
                textColor: Colors.green,
                hideText: false,
                textController: _codUsuarioController,
                inputType: TextInputType.number,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese su código de Suministro de Celta';
                  }
                  return null;
                },
              ),
              AuthButton(
                  label: 'Registrar',
                  onPressed: () async {
                    var suminData = await suministro.getData(
                      _codUsuarioController.text.toString(),
                    );
                    if (suminData != null) {
                      await firestoreRegistration.buildUsuarioFirestore(
                          _nameController.text.toString(),
                          _codUsuarioController.text.toString());

                      Fluttertoast.showToast(
                          msg: 'Los datos se registraron correctamente');
                    } else {
                      Fluttertoast.showToast(
                          msg: 'El cod de suministro no existe');
                    }

                    //TODO: Verificar porque no funciona provider para pasar a FacPage()
                    /*      Navigator.pushAndRemoveUntil(
                        (context),
                        MaterialPageRoute(builder: (context) => FacPage()),
                        (route) => false); */
                  }

                  /* => widget.callback(
                  _nameController.toString(),
                  _codUsuarioController.toString(),
                ), */
                  )
            ],
          ),
        ),
      ),
    );
  }
}
