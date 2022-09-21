import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen(this.error);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(children: <Widget>[
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: Text("Whoops - Error: ${this.error}",
              style: TextStyle(
                  color: Color.fromARGB(255, 189, 27, 27),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 156.0),
              textAlign: TextAlign.center),
        ),
      ])),
    );
  }
}
