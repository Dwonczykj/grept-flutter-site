import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegisite/constants.dart';

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
                        "Download vegi",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            fontFamily: "FatFace-Regular",
                            fontFamilyFallback: ["Montserrat-Regular"],
                            color: Color(0xFF111111)),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () => _downloadAppStore(context),
                              icon: Icon(Icons.play_arrow),
                              label: Text('Apple')),
                          ElevatedButton.icon(
                              onPressed: () => _downloadPlayStore(context),
                              icon: Icon(Icons.play_arrow),
                              label: Text('Play Store')),
                        ],
                      )
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
    GoRouter.of(context).go(download_vegi_appstore_path);
  }

  void _downloadPlayStore(BuildContext context) {
    // route to internal route using go_route router first so that i can track the click and then use go_route to redirect to app_store
    GoRouter.of(context).go(download_vegi_playstore_path);
  }

}
