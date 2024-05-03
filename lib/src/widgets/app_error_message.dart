import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  ErrorMessage({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage,
        style: TextStyle(
          color: Colors.red,
          fontSize: 16.0,
          height: 1.0,
          fontWeight: FontWeight.w300,
        ));
  }
}
