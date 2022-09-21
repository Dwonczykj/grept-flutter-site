import 'package:flutter/material.dart';

class SellVegiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
          height: 600,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: .6,
                // <a href="https://www.freepik.com/free-photos-vectors/people">People vector created by stories - www.freepik.com</a>
                child: Image.network(
                    "assets/iPhone 12 Pro 6.1_ Mockup - vegi-pc-items.png",
                    scale: .85),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: .6,
                child: Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "vegi",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat-Regular",
                            color: Color(0xFF111111)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
