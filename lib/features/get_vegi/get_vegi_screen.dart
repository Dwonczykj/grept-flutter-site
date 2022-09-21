import 'package:flutter/material.dart';

class GetVegiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(children: <Widget>[
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: Text("Search",
              style: TextStyle(
                  color: Color(0xff757575),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 56.0),
              textAlign: TextAlign.center),
        ),
      ])),
    );
  }
}
