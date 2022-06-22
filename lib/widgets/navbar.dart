import 'package:flutter/material.dart';
import 'package:webapp/utils/colors_palette.dart';

class NavBar extends StatelessWidget {
  // Navigation Bar Items
  final navLinks = ["Food", "Shelter", "Toy", "Pets"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold")),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        // After doing Wrap with Row to the above Row,
        // below line of code doesn't seem to have effect
        // anymore on Container, SizedBox and Text.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(colors: [
                      color4,
                      color2,
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                child: Center(
                    child: Image.network("assets/reduced-green-300x233.png",
                        width: 50, height: 50)
                    // child: Text(
                    //   "",
                    //   style: TextStyle(fontSize: 30, color: Colors.white),
                    // ),
                ),
              ),
              SizedBox(
                width: 16,
                // child: Text("ttest"),
              ),
              Text("GRePT Wallet", style: TextStyle(fontSize: 26))
            ],
          ),
          // Responsive Layout
          // if (!ResponsiveLayout.isSmallScreen(context))
          //   Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: <Widget>[...navItem()]..add(InkWell(
          //           child: Container(
          //             margin: EdgeInsets.only(left: 20),
          //             width: 120,
          //             height: 40,
          //             decoration: BoxDecoration(
          //                 gradient: LinearGradient(
          //                     colors: [color6, color2],
          //                     begin: Alignment.bottomRight,
          //                     end: Alignment.topLeft),
          //                 borderRadius: BorderRadius.circular(20),
          //                 boxShadow: [
          //                   BoxShadow(
          //                       color: color3.withOpacity(.3),
          //                       offset: Offset(0, 8),
          //                       blurRadius: 8)
          //                 ]),
          //             child: Material(
          //               color: Colors.transparent,
          //               child: Center(
          //                 child: Text("Login",
          //                     style: TextStyle(
          //                         color: color4,
          //                         fontSize: 18,
          //                         letterSpacing: 1,
          //                         fontFamily: "Montserrat-Bold")),
          //               ),
          //             ),
          //           ),
          //         )))
          // else
          //   Image.network("assets/icons8-menu.png", width: 50, height: 50)
        ],
      ),
    );
  }
}
