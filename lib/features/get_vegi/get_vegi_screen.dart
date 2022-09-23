import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegisite/constants.dart';
import 'package:vegisite/utils/responsiveLayout.dart';
import 'package:vegisite/utils/theme.dart';

class GetVegiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 600,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: .6,
                child: Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            bottom: ResponsiveLayout.isLargeScreen(context)
                                ? 16.0
                                : 4.0),
                        child: Text(
                          "Download vegi",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              fontFamily: "FatFace-Regular",
                              fontFamilyFallback: ["Montserrat-Regular"],
                              color: themeShade1000),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                                ResponsiveLayout.isLargeScreen(context)
                                    ? 16.0
                                    : 4.0),
                            child: ElevatedButton.icon(
                                onPressed: () => _downloadAppStore(context),
                                icon: Icon(Icons.play_arrow),
                                label: Text('Apple')),
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                ResponsiveLayout.isLargeScreen(context)
                                    ? 16.0
                                    : 4.0),
                            child: ElevatedButton.icon(
                                onPressed: () => _downloadPlayStore(context),
                                icon: Icon(Icons.play_arrow),
                                label: Text('Play Store')),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: .55,
                // <a href="https://www.freepik.com/free-photos-vectors/people">People vector created by stories - www.freepik.com</a>
                child: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Positioned(
                          child: FractionallySizedBox(
                            alignment: Alignment.centerRight,
                            widthFactor: .9,
                            // heightFactor: 1.00,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () =>
                                    GoRouter.of(context).push('/$vegiEatRoute'),
                                child: Image.network(
                                  "assets/iPhone 12 Pro 6.1_ Mockup - vegi-pc-items.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: .5,
                        heightFactor: 1.00,
                        child: Container(
                          child: Center(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () =>
                                    GoRouter.of(context).push('/$vegiPayRoute'),
                                child: Image.network(
                                    "assets/images/vegi-pay-card.png",
                                    scale: 1.00),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _downloadAppStore(BuildContext context) {
    // route to internal route using go_route router first so that i can track the click and then use go_route to redirect to app_store
    GoRouter.of(context).go('/$download_vegi_appstore_path');
  }

  void _downloadPlayStore(BuildContext context) {
    // route to internal route using go_route router first so that i can track the click and then use go_route to redirect to app_store
    GoRouter.of(context).go('/$download_vegi_playstore_path');
  }

}
