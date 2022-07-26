import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/state_managers/app_state_manager.dart';
import 'package:webapp/utils/colors_palette.dart' hide Colors;
import 'package:webapp/widgets/unsubscribe.dart';

import 'utils/responsiveLayout.dart';
// import 'package:flutter_web/material.dart';
import 'widgets/navbar.dart';
import 'widgets/search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'GRePT - Green Rewards Platform',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.lightBlue,
      backgroundColor: color1,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appStateManager = AppStateManager();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      _appStateManager.isRegistered = true;
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
      ],
      child: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Color(0xFFFFFBFF),
                //       Color(0xFF3023AE),
                //     ])),
                child: Scaffold(
              backgroundColor: color10,
              body: SingleChildScrollView(
                  child: Column(
                children: <Widget>[NavBar(), Body()],
              )),
            ));
          }),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const listTextStyle = TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat-Regular",
        color: Color(0xFF111111));
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return SizedBox(
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
                                color: Color(0xFF111111)),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Welcome to the Green Rewards Point",
                              style: TextStyle(
                                  fontSize: 60, color: Color(0xFF8591B0)),
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
                                  color: Color.fromARGB(255, 45, 47, 50)),
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
                                )
                              : Unsubscribe(
                                  emailController: _emailController,
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
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 12.0, top: 20),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       SizedBox(
                          //         height: 12.0,
                          //         child: Text("1. Spend accross brands!",
                          //             style: listTextStyle),
                          //       ),
                          //       SizedBox(
                          //         height: 12.0,
                          //         child: Text(
                          //             "2. Cheaper for greener products and services",
                          //             style: listTextStyle),
                          //       ),
                          //       SizedBox(
                          //           height: 12.0,
                          //           child: Text("3. No loyalty card!",
                          //               style: listTextStyle)),
                          //     ],
                          //   ),
                          // )
                          // child: Text("Hello")),
                        ])))
          ],
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
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-Regular",
                  color: Color(0xFF111111)),
            ),
            RichText(
              text: TextSpan(
                text: "Welcome to the Green Rewards Point!",
                style: TextStyle(fontSize: 60, color: Color(0xFF8591B0)),
                children: [
                  TextSpan(
                      text: "",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        // color: Colors.black54
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network("assets/phone-qr.png", scale: 1),
            ),
            SizedBox(
              height: 32,
            ),
            !appStateManager.isRegistered
                ? Search(
                    emailController: _emailController,
                  )
                : Unsubscribe(
                    emailController: _emailController,
                  ),
            SizedBox(
              height: 30,
            ),
            if (appStateManager.appLoading)
              Center(child: CircularProgressIndicator()),
          ],
        ),
      ));
    });
  }
}
