import 'dart:ui';

import 'package:celta/widgets/authentication/auth_button.dart';
import 'package:celta/widgets/authentication/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, buttonUpText, buttonDownText;
  final Image? img;

  const CustomDialogBox(
      {this.title,
      this.descriptions,
      this.buttonUpText,
      this.img,
      this.buttonDownText});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title!,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.descriptions!,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              AuthTextField(
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese un email válido para continuar';
                  }
                  return null;
                },
                fieldIcon: Icons.home_work_rounded,
                hint: 'Ingrese un Suministro Válido',
                label: 'Código de Suministro',
                textColor: Colors.green,
                hideText: false,
                onChange: (value) {},
                textController: null,
                inputType: TextInputType.number,
              ),
              AuthButton(label: 'Agregar', onPressed: () {}),
              /* MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  widget.buttonUpText!,
                  style: TextStyle(fontSize: 20),
                ),
              ), */
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  widget.buttonDownText!,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset(
                  "assets/images/isologo-celtacoop.png",
                  fit: BoxFit.fill,
                )),
          ),
        ),
      ],
    );
  }
}
