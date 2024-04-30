import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/icon.gif'),
          width: 100.0,
        ),
        Text(
          "Flutter",
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Chat",
          style: TextStyle(
              fontSize: 45.0, fontWeight: FontWeight.w700, color: Colors.blue),
        ),
      ],
    );
  }
}
