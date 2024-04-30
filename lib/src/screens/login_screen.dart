// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat/src/widgets/app_button.dart';
import 'package:flutter_chat/src/widgets/app_icon.dart';
import 'package:flutter_chat/src/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(
              height: 48.0,
            ),
            AppTextField(
              inputText: "Ingresar Email",
              onChanged: (value) {
                // _email = value;
                // print(_email);
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            AppTextField(
              inputText: "Ingresar Contraseña",
              onChanged: (value) {
                // _password = value;
                // print(_password);
              },
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            AppButton(
              color: Colors.lightBlueAccent,
              accion: () {
                // Lógica de inicio de sesión
                // Navigator.pushNamed(context, '/login');
              },
              texto: "Log In",
            ),
          ],
        ),
      ),
    );
  }
}
