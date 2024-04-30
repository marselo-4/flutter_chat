import 'package:flutter/material.dart';
import 'package:flutter_chat/src/screens/login_screen.dart';
import 'package:flutter_chat/src/screens/register_screen.dart';
import 'package:flutter_chat/src/screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      }));
}
