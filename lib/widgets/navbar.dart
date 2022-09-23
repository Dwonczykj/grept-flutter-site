import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/responsiveLayout.dart';
import 'package:vegisite/utils/theme.dart';

class NavBar extends StatelessWidget {
  // Navigation Bar Items
  final navLinks = {
    "home": "",
    "sell on vegi": "sell-on-vegi",
    "get vegi": "get-vegi",
    "privacy & terms": "privacy",
  };

  iconNavLinks(BuildContext context) => <Widget>[
        _navBarIcon(context, 'assets/images/icons/instagram-icon.png',
            'https://www.instagram.com/vegi_liverpool/'),
        if (!kIsWeb && Platform.isIOS)
          _navBarIcon(context, 'assets/images/icons/appstore2-icon.png',
              'https://apps.apple.com/gb/app/vegi/id1608208174'),
        if (!kIsWeb && Platform.isAndroid)
          _navBarIcon(
              context,
              'assets/images/icons/googleplaystore-outline-icon.png',
              'https://play.google.com/store/apps/details?id=com.vegi.vegiapp'),
      ];

  List<Widget> navItem(BuildContext context) {
    return navLinks
        .map<String, Widget>((key, value) {
          return MapEntry(
              key,
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).go('/$value'),
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: Text(key,
                          style: TextStyle(
                              fontFamilyFallback: ["Montserrat-Bold"],
                              fontFamily: "FatCheeks-Regular")),
                    ),
                  ),
                ),
              ));
        })
        .values
        .toList()
      ..addAll(iconNavLinks(context));
  }

  final dio = Dio();

  Widget _navBarIcon(BuildContext context, String imageUrl, String navLink) =>
      Container(
        margin: EdgeInsets.only(left: 9, right: 9),
        child: GestureDetector(
          onTap: () => navLink.startsWith('http')
              ? launchUrlString(navLink)
              : GoRouter.of(context).go('/$navLink'),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              padding: EdgeInsets.only(left: 18),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment(-.2, 0),
                    // opacity: 0.25,
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
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
                    // gradient: LinearGradient(
                    //   colors: [
                    //     color4,
                    //     color2,
                    //   ],
                    //   begin: Alignment.bottomRight,
                    //   end: Alignment.topLeft
                    // )
                  ),
                  child: Center(
                      child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).go('/'),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            "https://is1-ssl.mzstatic.com/image/thumb/Purple112/v4/9b/cc/cf/9bcccff4-6adb-f3f5-e339-5939b5289025/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/460x0w.webp",
                            // "assets/reduced-green-300x233.png",
                            width: 50,
                            height: 50),
                      ),
                    ),
                  )
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
                Text("vegi",
                    style: TextStyle(fontSize: 26, color: themeShade1000))
              ],
            ),
            if (!ResponsiveLayout.isSmallScreen(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ...navItem(context),
                  // InkWell(
                  //   onTap: () async {
                  //     appStateManager.showVegi(context);
                  //     // final response = await dio.get(vegi_site);
                  //     if (!await launchUrlString(vegi_site))
                  //       throw 'Could not launch $vegi_site';
                  //   },
                  //   child: Container(
                  //     width: 60,
                  //     height: 60,
                  //     // decoration: BoxDecoration(
                  //     //   borderRadius: BorderRadius.circular(5),
                  //     //   gradient: LinearGradient(
                  //     //       colors: [
                  //     //         color9,
                  //     //         color2,
                  //     //       ],
                  //     //       begin: Alignment.bottomCenter,
                  //     //       end: Alignment.topCenter)
                  //     // ),
                  //     child: Center(
                  //         // child: Image.network("assets/Vegi-Logo-square.png",
                  //         //     width: 50, height: 50)
                  //         child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(8),
                  //       child: CachedNetworkImage(
                  //         imageUrl:
                  //             "https://is1-ssl.mzstatic.com/image/thumb/Purple112/v4/9b/cc/cf/9bcccff4-6adb-f3f5-e339-5939b5289025/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/460x0w.webp",
                  //         width: 50,
                  //         height: 50,
                  //         imageBuilder: (context, imageProvider) => Container(
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //               image: imageProvider,
                  //               fit: BoxFit.cover,
                  //               // colorFilter: ColorFilter.mode(
                  //               //     Colors.red, BlendMode.colorBurn)
                  //             ),
                  //           ),
                  //         ),
                  //         placeholder: (context, url) =>
                  //             CircularProgressIndicator(),
                  //         errorWidget: (context, url, error) =>
                  //             Icon(Icons.error),
                  //       ),
                  //     )
                  //         // child: Text(
                  //         //   "",
                  //         //   style: TextStyle(fontSize: 30, color: Colors.white),
                  //         // ),
                  //         ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 16,
                  //   // child: Text("ttest"),
                  // ),
                  // Text("Vegi", style: TextStyle(fontSize: 26))
                ],
              )
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
    });
  }
}
