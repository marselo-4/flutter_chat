// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String inputText;
  final ValueChanged<String> onSaved;
  final bool? obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final bool autoValidate;

  AppTextField(
      {required this.inputText,
      required this.onSaved,
      this.obscureText,
      this.controller,
      this.focusNode,
      this.validator,
      this.autoValidate = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode:
          autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        hintText: inputText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.lightBlueAccent.shade400, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      textAlign: TextAlign.center,
      obscureText: obscureText == null ? false : obscureText!,
      onSaved: (String? value) {
        onSaved(value!);
      },
      validator: validator,
    );
  }
}
