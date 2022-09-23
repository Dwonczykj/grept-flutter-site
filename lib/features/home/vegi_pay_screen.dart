import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegisite/common/links.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart';
import 'package:vegisite/utils/responsiveLayout.dart';
import 'package:vegisite/utils/theme.dart';

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
        "assets/images/vegi-pay-card.png",
        scale: 0.85,
        semanticLabel: 'vegi pay card',
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

class VegiPayMission extends StatelessWidget {
  const VegiPayMission({Key? key, this.isLarge = false}) : super(key: key);
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
            "vegiPay",
            key: appStateManager.vegiPayKey(context),
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat-Regular",
                color: themeAccent400),
          ),
          Container(
            margin: EdgeInsets.only(bottom: isLarge ? 30 : 20),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    "Making green products the cheapest to preserve our future!",
                style: TextStyle(fontSize: 45, color: themeAccent500),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: isLarge ? 30 : 20),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    "Buy groceries, takeaways and plant-based products from independent businesses using your vegi wallet.",
                style: TextStyle(fontSize: 30, color: themeAccent200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VegiPayScreen extends StatelessWidget {
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
                                child: VegiPayMission(
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
                        VegiPayMission(
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
