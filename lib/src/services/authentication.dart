// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/src/model/auth_request.dart';

class Authentication {
  final _auth = FirebaseAuth.instance;

  Future<AuthenticationRequest> createUser(
      {String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        authRequest.success = true;
      }
    } catch (e) {
      print(e);
    }
    return authRequest;
  }

  Future<User?> getCurrentUser() async {
    try {
      if (_auth.currentUser! != null) {
        return await _auth.currentUser;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<AuthenticationRequest> loginUser(
      {String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        authRequest.success = true;
      }
    } catch (e) {
      print(e.toString());
    }
    return authRequest;
  }
}
