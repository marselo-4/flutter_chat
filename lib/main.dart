import 'package:flutter/material.dart';
import 'package:flutter_chat/src/screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    home: WelcomeScreen(),
    theme: ThemeData(
      textTheme: TextTheme(
        body1: TextStyle(color: Colors.grey[800], fontSize: 16.0),
      ),
    ),
  ));
}
