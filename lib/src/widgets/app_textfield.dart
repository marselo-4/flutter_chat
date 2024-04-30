// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String inputText;
  final ValueChanged<String> onChanged;
  final bool? obscureText;
  AppTextField(
      {required this.inputText, required this.onChanged, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      onChanged: onChanged,
    );
  }
}
