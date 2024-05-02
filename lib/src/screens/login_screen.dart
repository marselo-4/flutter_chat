// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat/src/mixins/validation_mixins.dart';
import 'package:flutter_chat/src/services/authentication.dart';
import 'package:flutter_chat/src/widgets/app_button.dart';
import 'package:flutter_chat/src/widgets/app_icon.dart';
import 'package:flutter_chat/src/widgets/app_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    FocusNode? _focusnode;
    bool showSpinner = false;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    void initState() {
      super.initState();
      _focusnode = FocusNode();
      Future.delayed(Duration.zero, () {
        FocusScope.of(context).requestFocus(_focusnode);
      });
    }

    @override
    void dispose() {
      super.dispose();
      _focusnode!.dispose();
    }

    void setSpinnerStatus(bool status) {
      setState(() {
        showSpinner = status;
      });
    }

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
            setSpinnerStatus(true);
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
            setSpinnerStatus(false);
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
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Form(
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
                      height: 24.0,
                    ),
                    _loginButton(),
                  ],
                ),
              ),
            )));
  }
}
