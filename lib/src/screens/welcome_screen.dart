// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_chat/src/widgets/app_button.dart';
import 'package:flutter_chat/src/widgets/app_icon.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppIcon(),
          SizedBox(
            height: 48.0,
          ),
          AppButton(
            color: Colors.lightBlueAccent,
            accion: () {
              Navigator.pushNamed(context, '/login');
            },
            texto: "Log In",
          ),
          AppButton(
            color: Colors.blueAccent,
            accion: () {
              Navigator.pushNamed(context, '/register');
            },
            texto: "Register",
          ),
        ],
      ),
    ));
  }
}
