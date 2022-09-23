import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegisite/features/home/actions.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart';
import 'package:vegisite/utils/responsiveLayout.dart';
import 'package:vegisite/utils/theme.dart';
import 'package:vegisite/widgets/search.dart';

final vegiScreenShot = Image.network(
    "assets/iPhone 12 Pro 6.1_ Mockup - vegi-pc-items.png",
    scale: .85);

List<Widget> PageBreak({required bool isLarge}) => [
      SizedBox(
        height: isLarge ? 60 : 30,
      ),
      SizedBox(
        height: 5,
        child: Container(
          decoration: BoxDecoration(
            color: color9,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
      ),
      SizedBox(
        height: isLarge ? 60 : 30,
      )
    ];

class VegiMissionStatement extends StatelessWidget {
  const VegiMissionStatement({Key? key, this.isLarge = false})
      : super(key: key);
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLarge ? 30 : 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: isLarge ? 40 : 20),
              child: Text(
                "vegi",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat-Regular",
                    color: color9),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: RichText(
                text: TextSpan(
                  text: "The solution to insustainable products & services!",
                  style: TextStyle(fontSize: 40, color: color9),
                  children: [
                    TextSpan(
                        text: "🌏",
                        semanticsLabel: "'Earth'",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black54
                        ))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: RichText(
                text: TextSpan(
                  text: "",
                  style: TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 45, 47, 50)),
                  children: [
                    TextSpan(
                        text: "Register ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: color7)),
                    TextSpan(
                        text: "early",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: themeShade400)),
                    TextSpan(
                        text: " interest in ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: color7)),
                    TextSpan(
                        text: "vegi",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: themeShade1000)),
                    TextSpan(
                        text: " for exclusive ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: color7)),
                    TextSpan(
                        text: "cash rewards",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: themeShade400)),
                    TextSpan(
                        text: " in your wallet!",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: color7)),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class SubscribeInput extends StatelessWidget {
  const SubscribeInput(
      {Key? key, required this.emailController, this.isLarge = false})
      : super(key: key);
  final bool isLarge;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    final appStateManager = Provider.of<AppStateManager>(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
          margin: EdgeInsets.only(bottom: isLarge ? 40 : 30),
          child: !appStateManager.isRegistered
              ? Search(
                  emailController: this.emailController,
                  inputHint: 'Email',
                  buttonLabel: 'Notify',
                  onSubmit: () async {
                    return subscribeEmail(
                        appStateManager: appStateManager,
                        context: context,
                        email: this.emailController.text);
                  },
                )
              : Search(
                  emailController: this.emailController,
                  inputHint: 'Email',
                  buttonLabel: 'Unsubscribe',
                  onSubmit: () async {
                    return unsubscribeEmail(
                        appStateManager: appStateManager,
                        context: context,
                        email: this.emailController.text);
                  },
                )),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // const listTextStyle = TextStyle(
    //     fontSize: 60,
    //     fontWeight: FontWeight.bold,
    //     fontFamily: "Montserrat-Regular",
    //     color: Color(0xFF111111));
    return ResponsiveLayoutBuilder(responsiveBuilder: (context, isLarge) {
      return Consumer<AppStateManager>(
          builder: (context, appStateManager, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: isLarge
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: isLarge
                    ? [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: .6,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 48),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            VegiMissionStatement(),
                                            SubscribeInput(
                                              emailController: _emailController,
                                            ),
                                            if (appStateManager.appLoading)
                                              Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          ]))),
                              FractionallySizedBox(
                                alignment: Alignment.centerRight,
                                widthFactor: .6,
                                // <a href="https://www.freepik.com/free-photos-vectors/people">People vector created by stories - www.freepik.com</a>
                                child: vegiScreenShot,
                              ),
                            ],
                          ),
                        ),

                        // SizedBox(
                        //   height: 600,
                        //   child: Stack(
                        //     fit: StackFit.expand,
                        //     children: <Widget>[
                        //       FractionallySizedBox(
                        //           alignment: Alignment.center,
                        //           widthFactor: .7,
                        //           child: Container(
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     alignment: Alignment(-.2, 0),
                        //                     opacity: 0.3,
                        //                     image: NetworkImage(
                        //                         "assets/global_warming_house_fire.jpg"),
                        //                     fit: BoxFit.cover),
                        //                 borderRadius:
                        //                     BorderRadius.all(Radius.circular(25)),
                        //               ),
                        //               padding: EdgeInsets.all(48),
                        //               child: Column(
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   mainAxisAlignment: MainAxisAlignment.center,
                        //                   children: <Widget>[
                        //                     Text(
                        //                       "Our Emergency",
                        //                       style: TextStyle(
                        //                           fontSize: 60,
                        //                           fontWeight: FontWeight.bold,
                        //                           fontFamily: "Montserrat-Regular",
                        //                           color: color11),
                        //                     ),
                        //                     RichText(
                        //                       text: TextSpan(
                        //                         text:
                        //                             "Our climate and society is already at breaking point and our future as a society in peril. It is crucial for all of us to radically change our reliance on insustainable products!",
                        //                         style: TextStyle(
                        //                             fontSize: 40,
                        //                             color:
                        //                                 Color.fromARGB(236, 139, 47, 3)),
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 12,
                        //                     ),
                        //                     RichText(
                        //                       text: TextSpan(
                        //                         text:
                        //                             "Up to now, this has been financially impossible for most of us!",
                        //                         style: TextStyle(
                        //                             fontSize: 40,
                        //                             color:
                        //                                 Color.fromARGB(236, 139, 47, 3)),
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 12,
                        //                     ),
                        //                     RichText(
                        //                       text: TextSpan(
                        //                         text: "This ends now!",
                        //                         style: TextStyle(
                        //                             fontSize: 40,
                        //                             color:
                        //                                 Color.fromARGB(236, 139, 47, 3)),
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 40,
                        //                     ),
                        //                     if (appStateManager.appLoading)
                        //                       Center(child: CircularProgressIndicator()),
                        //                   ]))),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 5,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: color9,
                        //       borderRadius: BorderRadius.all(Radius.circular(25)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 600,
                        //   child: Stack(
                        //     fit: StackFit.expand,
                        //     children: <Widget>[
                        //       FractionallySizedBox(
                        //         alignment: Alignment.center,
                        //         widthFactor: .65,
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             RichText(
                        //               text: TextSpan(
                        //                 text: "What is worse?",
                        //                 style: TextStyle(fontSize: 60, color: color11),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 12,
                        //             ),
                        //             Center(
                        //               child: Image.network(
                        //                 "assets/GRePTPitchDeck-EggVsAvocado.jpg",
                        //                 scale: 0.85,
                        //                 semanticLabel: 'egg v avocado. what is worse',
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 5,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: color9,
                        //       borderRadius: BorderRadius.all(Radius.circular(25)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 600,
                        //   child: Stack(
                        //     fit: StackFit.expand,
                        //     children: <Widget>[
                        //       FractionallySizedBox(
                        //         alignment: Alignment.center,
                        //         widthFactor: .65,
                        //         child: Center(
                        //           child: Image.network(
                        //             "assets/GRePTPitchDeck-YourJourney.jpg",
                        //             scale: 0.85,
                        //             semanticLabel: 'User experience',
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 5,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: color9,
                        //       borderRadius: BorderRadius.all(Radius.circular(25)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 600,
                        //   child: Stack(
                        //     fit: StackFit.expand,
                        //     children: <Widget>[
                        //       FractionallySizedBox(
                        //         alignment: Alignment.center,
                        //         widthFactor: .65,
                        //         child: Center(
                        //           child: Image.network(
                        //             "assets/GRePTPitchDeck-WhatSetsUsApart.jpg",
                        //             scale: 0.85,
                        //             semanticLabel: 'Our Solution',
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 5,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: color9,
                        //       borderRadius: BorderRadius.all(Radius.circular(25)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),

                        // SizedBox(
                        //     height: 600,
                        //     child: Stack(
                        //       fit: StackFit.expand,
                        //       children: <Widget>[
                        //         FractionallySizedBox(
                        //           alignment: Alignment.centerRight,
                        //           widthFactor: .6,
                        //           // <a href="https://www.freepik.com/free-photos-vectors/people">People vector created by stories - www.freepik.com</a>
                        //           child: Image.network("assets/phone-qr.png", scale: .85),
                        //         ),
                        //         FractionallySizedBox(
                        //           alignment: Alignment.centerLeft,
                        //           widthFactor: .6,
                        //           child: Padding(
                        //             padding: EdgeInsets.only(left: 48),
                        //             child: Column(
                        //               crossAxisAlignment: CrossAxisAlignment.start,
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: <Widget>[
                        //                   // Padding(
                        //                   //   padding: const EdgeInsets.only(left: 12.0, top: 20),
                        //                   //   child: Column(
                        //                   //     crossAxisAlignment: CrossAxisAlignment.start,
                        //                   //     mainAxisAlignment: MainAxisAlignment.start,
                        //                   //     children: [
                        //                   //       SizedBox(
                        //                   //         height: 12.0,
                        //                   //         child: Text("1. Spend accross brands!",
                        //                   //             style: listTextStyle),
                        //                   //       ),
                        //                   //       SizedBox(
                        //                   //         height: 12.0,
                        //                   //         child: Text(
                        //                   //             "2. Cheaper for greener products and services",
                        //                   //             style: listTextStyle),
                        //                   //       ),
                        //                   //       SizedBox(
                        //                   //           height: 12.0,
                        //                   //           child: Text("3. No loyalty card!",
                        //                   //               style: listTextStyle)),
                        //                   //     ],
                        //                   //   ),
                        //                   // ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     )),
                      ]
                    : [
                        VegiMissionStatement(),
                        SubscribeInput(
                          emailController: _emailController,
                        ),
                        Center(child: vegiScreenShot),
                      ],
              ),
            ),
          ),
        );
      });
    });
  }
}

// class SmallChild extends StatelessWidget {
//   final _emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppStateManager>(
//         builder: (context, appStateManager, child) {
//       return SafeArea(
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: EdgeInsets.all(40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               VegiMissionStatement(),
//               SubscribeInput(
//                 emailController: _emailController,
//               ),
//               Center(child: vegiScreenShot),
//               // Container(
//               //     decoration: BoxDecoration(
//               //       image: DecorationImage(
//               //           alignment: Alignment(-.2, 0),
//               //           opacity: 0.3,
//               //           image:
//               //               NetworkImage("assets/global_warming_house_fire.jpg"),
//               //           fit: BoxFit.cover),
//               //       borderRadius: BorderRadius.all(Radius.circular(25)),
//               //     ),
//               //     padding: EdgeInsets.all(48),
//               //     child: Column(
//               //         crossAxisAlignment: CrossAxisAlignment.start,
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: <Widget>[
//               //           Text(
//               //             "Our Emergency",
//               //             style: TextStyle(
//               //                 fontSize: 60,
//               //                 fontWeight: FontWeight.bold,
//               //                 fontFamily: "Montserrat-Regular",
//               //                 color: color11),
//               //           ),
//               //           RichText(
//               //             text: TextSpan(
//               //               text:
//               //                   "Our climate and society is already at breaking point and our future as a society in peril. It is crucial for all of us to radically change our reliance on insustainable products!",
//               //               style: TextStyle(
//               //                   fontSize: 40,
//               //                   color: Color.fromARGB(236, 139, 47, 3)),
//               //             ),
//               //           ),
//               //           SizedBox(
//               //             height: 12,
//               //           ),
//               //           RichText(
//               //             text: TextSpan(
//               //               text:
//               //                   "Up to now, this has been financially impossible for most of us!",
//               //               style: TextStyle(
//               //                   fontSize: 40,
//               //                   color: Color.fromARGB(236, 139, 47, 3)),
//               //             ),
//               //           ),
//               //           SizedBox(
//               //             height: 12,
//               //           ),
//               //           RichText(
//               //             text: TextSpan(
//               //               text: "This ends now!",
//               //               style: TextStyle(
//               //                   fontSize: 40,
//               //                   color: Color.fromARGB(236, 139, 47, 3)),
//               //             ),
//               //           ),
//               //           SizedBox(
//               //             height: 40,
//               //           ),
//               //           if (appStateManager.appLoading)
//               //             Center(child: CircularProgressIndicator()),
//               //         ])),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // SizedBox(
//               //   height: 5,
//               //   child: Container(
//               //     decoration: BoxDecoration(
//               //       color: color9,
//               //       borderRadius: BorderRadius.all(Radius.circular(25)),
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // RichText(
//               //   text: TextSpan(
//               //     text: "What is worse?",
//               //     style: TextStyle(fontSize: 40, color: color11),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 12,
//               // ),
//               // Center(
//               //   child: Image.network(
//               //     "assets/GRePTPitchDeck-EggVsAvocado.jpg",
//               //     scale: 0.85,
//               //     semanticLabel: 'egg v avocado. what is worse',
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // SizedBox(
//               //   height: 5,
//               //   child: Container(
//               //     decoration: BoxDecoration(
//               //       color: color9,
//               //       borderRadius: BorderRadius.all(Radius.circular(25)),
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // Center(
//               //   child: Image.network(
//               //     "assets/GRePTPitchDeck-YourJourney.jpg",
//               //     scale: 0.5,
//               //     semanticLabel: 'User Experience',
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // SizedBox(
//               //   height: 5,
//               //   child: Container(
//               //     decoration: BoxDecoration(
//               //       color: color9,
//               //       borderRadius: BorderRadius.all(Radius.circular(25)),
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // Center(
//               //   child: Image.network(
//               //     "assets/GRePTPitchDeck-WhatSetsUsApart.jpg",
//               //     scale: 0.5,
//               //     semanticLabel: 'Our Solution',
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//               // SizedBox(
//               //   height: 5,
//               //   child: Container(
//               //     decoration: BoxDecoration(
//               //       color: color9,
//               //       borderRadius: BorderRadius.all(Radius.circular(25)),
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // ),
//             ],
//           ),
//         )),
//       );
//     });
//   }
// }
