// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/mixins/validation_mixins.dart';
import 'package:flutter_chat/src/services/authentication.dart';
import 'package:flutter_chat/src/widgets/app_button.dart';
import 'package:flutter_chat/src/widgets/app_icon.dart';
import 'package:flutter_chat/src/widgets/app_textfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode? _focusnode;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusnode = FocusNode();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusnode!.dispose();
  }

  String _password = "";

  @override
  Widget build(BuildContext context) {
    Widget _emailField() {
      return AppTextField(
        focusNode: _focusnode,
        controller: _emailController,
        inputText: "Ingresar Email",
        onSaved: (value) {},
        validator: ValidationMixins().validateEmail,
      );
    }

    Widget _passwordField() {
      return AppTextField(
        controller: _passwordController,
        inputText: "Ingresar Contraseña",
        onSaved: (value) {},
        obscureText: true,
        validator: ValidationMixins().validatePassword,
      );
    }

    Widget _loginButton() {
      return AppButton(
        color: Colors.lightBlueAccent,
        accion: () async {
          if (_formKey.currentState!.validate()) {
            // Lógica de inicio de sesión
            var newUser = await Authentication().loginUser(
                email: _emailController.text,
                password: _passwordController.text);
            if (newUser != null) {
              Navigator.pushNamed(context, '/chat');
            }
            FocusScope.of(context).requestFocus(_focusnode);
            _emailController.clear();
            _passwordController.clear();
          }
        },
        texto: "Log In",
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppIcon(),
              SizedBox(
                height: 48.0,
              ),
              _emailField(),
              SizedBox(
                height: 10.0,
              ),
              _passwordField(),
              SizedBox(
                height: 10.0,
              ),
              AppTextField(
                inputText: "Repite tu Contraseña",
                onSaved: (value) => {
                  if (value == _password)
                    print("Correcto")
                  else
                    print("Incorrecto")
                },
                obscureText: true,
              ),
              SizedBox(
                height: 24.0,
              ),
              _loginButton(),
            ],
          ),
          // pon un boton para regresar
        ),
      ),
    );
  }
}
