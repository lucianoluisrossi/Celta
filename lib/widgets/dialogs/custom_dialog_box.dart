import 'dart:ui';

import 'package:celta/widgets/authentication/auth_button.dart';
import 'package:celta/widgets/authentication/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, buttonUpText, buttonDownText;
  final Image? img;
  final Function()? onPressUp;
  final Function()? onPressDown;
  final Function()? textFieldValidate;
  final IconData? textFieldIcon;
  final String? textFieldHint;
  final String? textFieldLabel;
  final Color? textFieldColor;
  final bool? textFieldHideText;
  final Function()? textFieldOnChange;
  final TextEditingController? textFieldController;
  final TextInputType? textFieldInputType;

  const CustomDialogBox({
    this.title,
    this.descriptions,
    this.buttonUpText,
    this.img,
    this.buttonDownText,
    required this.onPressUp,
    required this.onPressDown,
    this.textFieldColor,
    this.textFieldController,
    this.textFieldHideText,
    this.textFieldHint,
    this.textFieldIcon,
    this.textFieldInputType,
    this.textFieldLabel,
    this.textFieldOnChange,
    this.textFieldValidate,
  });

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
                fieldIcon: widget.textFieldIcon,
                hint: widget.textFieldHint,
                label: widget.textFieldLabel,
                textColor: widget.textFieldColor,
                hideText: widget.textFieldHideText,
                //onChange: (value) {},
                textController: widget.textFieldController,
                inputType: widget.textFieldInputType,
              ),
              AuthButton(label: 'Agregar', onPressed: widget.onPressUp!),
              MaterialButton(
                onPressed: widget.onPressDown,
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
