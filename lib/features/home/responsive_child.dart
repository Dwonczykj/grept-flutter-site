import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegisite/common/links.dart';
import 'package:vegisite/features/home/actions.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart';
import 'package:vegisite/widgets/search.dart';

class LargeChild extends StatelessWidget {
  final _emailController = TextEditingController();

  final isLarge = true;

  @override
  Widget build(BuildContext context) {
    // const listTextStyle = TextStyle(
    //     fontSize: 60,
    //     fontWeight: FontWeight.bold,
    //     fontFamily: "Montserrat-Regular",
    //     color: Color(0xFF111111));
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      widthFactor: .6,
                      // <a href="https://www.freepik.com/free-photos-vectors/people">People vector created by stories - www.freepik.com</a>
                      child: Image.network("assets/phone-qr.png", scale: .85),
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
                                    "GRePT",
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Montserrat-Regular",
                                        color: color9),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          "Welcome to the Green Rewards Point",
                                      style: TextStyle(
                                          fontSize: 60,
                                          color: Color(0xFF8591B0)),
                                      children: [
                                        TextSpan(
                                            text: "🌏",
                                            style: TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.black54
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color:
                                              Color.fromARGB(255, 45, 47, 50)),
                                      children: [
                                        TextSpan(
                                            text:
                                                "Subscribe below for early access to ",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: color7)),
                                        TextSpan(
                                            text: "green discounts",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: color10)),
                                        TextSpan(
                                            text: " in your wallet!",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: color7)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  !appStateManager.isRegistered
                                      ? Search(
                                          emailController: _emailController,
                                          inputHint: 'Email',
                                          buttonLabel: 'Notify',
                                          onSubmit: () async {
                                            return subscribeEmail(
                                                appStateManager:
                                                    appStateManager,
                                                context: context,
                                                email: _emailController.text);
                                          },
                                        )
                                      : Search(
                                          emailController: _emailController,
                                          inputHint: 'Email',
                                          buttonLabel: 'Unsubscribe',
                                          onSubmit: () async {
                                            return unsubscribeEmail(
                                                appStateManager:
                                                    appStateManager,
                                                context: context,
                                                email: _emailController.text);
                                          },
                                        ),

                                  // RichText(
                                  //   text: TextSpan(
                                  //     text:
                                  //         "We respect your privacy. Unsubscribe at any time.",
                                  //     style: TextStyle(fontSize: 18, color: color7),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 40,
                                  // ),
                                  // ElevatedButton(
                                  //     onPressed: () async {
                                  //       unsubscribeUser(email: _emailController.text);
                                  //     },
                                  //     child: Text("Unsubscribe"))
                                  SizedBox(
                                    height: 40,
                                  ),
                                  if (appStateManager.appLoading)
                                    Center(child: CircularProgressIndicator()),
                                ])))
                  ],
                ),
              ),
              SizedBox(
                height: 60,
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
                height: 60,
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

              SizedBox(
                height: 600,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      widthFactor: .65,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            if (!await launchUrlString(vegi_site))
                              throw 'Could not launch $vegi_site';
                          },
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Image.network(
                            "assets/vegi-phone-splash.png",
                            scale: 0.85,
                            semanticLabel: 'vegi phone splash',
                          ),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: .3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 48),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Vegi - Green Points Platform",
                              key: appStateManager.vegiKey(context),
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat-Regular",
                                  color: color9),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "the place for plant-based",
                                style: TextStyle(
                                    fontSize: 45, color: Color(0xFF8591B0)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RichText(
                              text: TextSpan(
                                text:
                                    "Buy groceries, takeaways and plant-based products from independent businesses using your vegi wallet.",
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xFF8591B0)),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            // InkWell(
                            //   onTap: () async {
                            //     if (!await launchUrlString(vegi_site))
                            //       throw 'Could not launch $vegi_site';
                            //   },
                            //   child: Center(
                            //     child: Image.network(
                            //       "assets/vegi-phone-splash.png",
                            //       scale: 0.05,
                            //       semanticLabel: 'vegi phone splash',
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 40,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
            ],
          ),
        ),
      );
    });
  }
}

class SmallChild extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "GRePT",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-Regular",
                  color: color9),
            ),
            RichText(
              text: TextSpan(
                text: "Welcome to the Green Rewards Point!",
                style: TextStyle(fontSize: 30, color: Color(0xFF8591B0)),
                // children: [
                //   TextSpan(
                //       text: "",
                //       style: TextStyle(
                //         fontSize: 40,
                //         fontWeight: FontWeight.bold,
                //         // color: Colors.black54
                //       ))
                // ],
              ),
            ),
            !appStateManager.isRegistered
                ? Search(
                    emailController: _emailController,
                    inputHint: 'Email',
                    buttonLabel: '',
                    onSubmit: () async {
                      return subscribeEmail(
                          appStateManager: appStateManager,
                          context: context,
                          email: _emailController.text);
                    },
                  )
                : Search(
                    emailController: _emailController,
                    inputHint: 'Email',
                    buttonLabel: '',
                    onSubmit: () async {
                      return unsubscribeEmail(
                          appStateManager: appStateManager,
                          context: context,
                          email: _emailController.text);
                    },
                  ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network("assets/phone-qr.png", scale: 0.5),
            ),
            SizedBox(
              height: 30,
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
              height: 30,
            ),
            // Container(
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //           alignment: Alignment(-.2, 0),
            //           opacity: 0.3,
            //           image:
            //               NetworkImage("assets/global_warming_house_fire.jpg"),
            //           fit: BoxFit.cover),
            //       borderRadius: BorderRadius.all(Radius.circular(25)),
            //     ),
            //     padding: EdgeInsets.all(48),
            //     child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Text(
            //             "Our Emergency",
            //             style: TextStyle(
            //                 fontSize: 60,
            //                 fontWeight: FontWeight.bold,
            //                 fontFamily: "Montserrat-Regular",
            //                 color: color11),
            //           ),
            //           RichText(
            //             text: TextSpan(
            //               text:
            //                   "Our climate and society is already at breaking point and our future as a society in peril. It is crucial for all of us to radically change our reliance on insustainable products!",
            //               style: TextStyle(
            //                   fontSize: 40,
            //                   color: Color.fromARGB(236, 139, 47, 3)),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 12,
            //           ),
            //           RichText(
            //             text: TextSpan(
            //               text:
            //                   "Up to now, this has been financially impossible for most of us!",
            //               style: TextStyle(
            //                   fontSize: 40,
            //                   color: Color.fromARGB(236, 139, 47, 3)),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 12,
            //           ),
            //           RichText(
            //             text: TextSpan(
            //               text: "This ends now!",
            //               style: TextStyle(
            //                   fontSize: 40,
            //                   color: Color.fromARGB(236, 139, 47, 3)),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 40,
            //           ),
            //           if (appStateManager.appLoading)
            //             Center(child: CircularProgressIndicator()),
            //         ])),
            // SizedBox(
            //   height: 30,
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
            //   height: 30,
            // ),
            // RichText(
            //   text: TextSpan(
            //     text: "What is worse?",
            //     style: TextStyle(fontSize: 40, color: color11),
            //   ),
            // ),
            // SizedBox(
            //   height: 12,
            // ),
            // Center(
            //   child: Image.network(
            //     "assets/GRePTPitchDeck-EggVsAvocado.jpg",
            //     scale: 0.85,
            //     semanticLabel: 'egg v avocado. what is worse',
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
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
            //   height: 30,
            // ),
            // Center(
            //   child: Image.network(
            //     "assets/GRePTPitchDeck-YourJourney.jpg",
            //     scale: 0.5,
            //     semanticLabel: 'User Experience',
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
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
            //   height: 30,
            // ),
            // Center(
            //   child: Image.network(
            //     "assets/GRePTPitchDeck-WhatSetsUsApart.jpg",
            //     scale: 0.5,
            //     semanticLabel: 'Our Solution',
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
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
            //   height: 30,
            // ),
            Text(
              "Vegi - Green Points Platform",
              key: appStateManager.vegiKey(context),
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-Regular",
                  color: color9),
            ),
            RichText(
              text: TextSpan(
                text: "the place for plant-based",
                style: TextStyle(fontSize: 30, color: Color(0xFF8591B0)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text:
                    "Buy groceries, takeaways and plant-based products from independent businesses using your vegi wallet.",
                style: TextStyle(fontSize: 20, color: Color(0xFF8591B0)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (!await launchUrlString(vegi_site))
                  throw 'Could not launch $vegi_site';
              },
              child: Center(
                child: Image.network(
                  "assets/vegi-phone-splash.png",
                  scale: 0.5,
                  semanticLabel: 'vegi phone splash',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ));
    });
  }
}
