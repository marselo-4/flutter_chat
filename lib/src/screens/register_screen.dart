import 'package:flutter/material.dart';
import 'package:flutter_chat/src/widgets/app_button.dart';
import 'package:flutter_chat/src/widgets/app_icon.dart';
import 'package:flutter_chat/src/widgets/app_textfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = "";
  String _password = "";

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
                  _email = value;
                  print(_email);
                },
                obscureText: false),
            SizedBox(
              height: 8.0,
            ),
            AppTextField(
              inputText: "Ingresar Contraseña",
              onChanged: (value) {
                _password = value;
                print(_password);
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            AppTextField(
              inputText: "Repite tu Contraseña",
              onChanged: (value) => {if (value == _password) print("Correcto")},
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            AppButton(
                color: Colors.blueAccent, accion: () {}, texto: "Registrarse")
          ],
        ),
        // pon un boton para regresar
      ),
    );
  }
}
