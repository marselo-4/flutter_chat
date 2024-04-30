import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final MaterialAccentColor color;
  final VoidCallback accion;
  final String texto;

  const AppButton(
      {required this.color, required this.accion, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          elevation: 6.0,
          child: SizedBox(
            height: 43.0,
            child: MaterialButton(
              onPressed: accion,
              minWidth: 200.0,
              child: Text(texto,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  )),
            ),
          ),
        ));
  }
}
