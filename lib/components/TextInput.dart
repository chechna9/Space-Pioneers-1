import 'package:flutter/material.dart';
import 'constants.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key key,
    this.labelText,
    this.obscured: false, this.controller , String Function(String) validator,
  }) : super(key: key);

  final String labelText;
  final bool obscured;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscured,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w100,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: true,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myRed, width: 2),
            borderRadius: BorderRadius.circular(100)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myRed, width: 2),
            borderRadius: BorderRadius.circular(100)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myRed, width: 2),
            borderRadius: BorderRadius.circular(100)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: myBlue, width: 2),
          borderRadius: BorderRadius.circular(100),
        ),
        contentPadding: EdgeInsets.only(left: 25, top: 20, bottom: 20),
      ),
      //onChanged: (val) => userName = val,
      validator: (val) => val.isEmpty ? 'Il faut remplire ce champ' : null,
    );
  }
}
