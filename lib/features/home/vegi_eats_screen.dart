import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegisite/common/links.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart';
import 'package:vegisite/utils/responsiveLayout.dart';

final vegiScreenShot = Image.network(
    "assets/iPhone 12 Pro 6.1_ Mockup - vegi-pc-items.png",
    scale: .85);

class VegiPhoneSplash extends StatelessWidget {
  const VegiPhoneSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}

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

class VegiEatsMission extends StatelessWidget {
  const VegiEatsMission({Key? key, this.isLarge = false}) : super(key: key);
  final bool isLarge;
  @override
  Widget build(BuildContext context) {
    final appStateManager = Provider.of<AppStateManager>(context);
    return Container(
      padding: EdgeInsets.only(left: 48),
      margin: EdgeInsets.only(bottom: isLarge ? 40 : 30),
      child: Column(
        crossAxisAlignment:
            isLarge ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        mainAxisAlignment:
            isLarge ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "vegi",
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
              style: TextStyle(fontSize: 45, color: Color(0xFF8591B0)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              text:
                  "Buy groceries, takeaways and plant-based products from independent businesses using your vegi wallet.",
              style: TextStyle(fontSize: 30, color: Color(0xFF8591B0)),
            ),
          ),
          SizedBox(
            height: 30,
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
    );
  }
}

class VegiEatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          height: 600,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: .3,
                                child: VegiEatsMission(
                                  isLarge: true,
                                ),
                              ),
                              FractionallySizedBox(
                                alignment: Alignment.centerRight,
                                widthFactor: .65,
                                child: Center(
                                  child: VegiPhoneSplash(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    : [
                        VegiEatsMission(
                          isLarge: false,
                        ),
                        VegiPhoneSplash(),
                      ],
              ),
            ),
          ),
        );
      });
    });
  }
}
