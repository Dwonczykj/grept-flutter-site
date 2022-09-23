import 'package:flutter/material.dart';
import 'package:vegisite/utils/responsiveLayout.dart';
import 'package:vegisite/utils/theme.dart';

class SellVegiScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final viewWidth = MediaQuery.of(context).size.width;
    return ResponsiveLayoutBuilder(
      responsiveBuilder: (context, isLargeScreen) => Center(
        child: SizedBox(
            height: 600,
            child: isLargeScreen
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Card(
                          color: themeAccent200,
                          child: Container(
                              // height: 200,
                              width: viewWidth * (isLargeScreen ? 0.45 : 0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Shop vegan on vegi',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "FatCheeks-Regular",
                                            fontFamilyFallback: [
                                              "Montserrat-Regular"
                                            ],
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      child: RichText(
                                        text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFF111111)),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "vegi is an app with exclusively ",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.normal,
                                                  // color: Colors.black54
                                                )),
                                            TextSpan(
                                                text: "vegan",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: themeAccent600)),
                                            TextSpan(
                                                text: ' products.',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.normal,
                                                  // color: Colors.black54
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: RichText(
                                            text: TextSpan(
                                              text: '',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Color(0xFF111111)),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "Think groceries, veg boxes & takeaways from all your favourite ",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      // color: Colors.black54
                                                    )),
                                                TextSpan(
                                                    text: "independents",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: themeShade1200)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: Text(
                                            '''You can collect, or if you\'re in Liverpool you can get a delivery from our zero-carbon cyclist courier partners Agile''',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "FatCheeks-Regular",
                                                fontFamilyFallback: [
                                                  "Montserrat-Regular"
                                                ],
                                                color: Color(0xFF111111)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Card(
                          color: themeShade200,
                          child: Container(
                              // height: 200,
                              width: viewWidth * (isLargeScreen ? 0.45 : 0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Sell vegan on vegi',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "FatCheeks-Regular",
                                            fontFamilyFallback: [
                                              "Montserrat-Regular"
                                            ],
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      child: Text(
                                        '''If you sell plant-based products, you can sell on vegi!''',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "FatCheeks-Regular",
                                            fontFamilyFallback: [
                                              "Montserrat-Regular"
                                            ],
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: Text(
                                            '''vegi makes it easy for plant-based entrepreneurs and seasoned business professionals to reach a vegan-ish audience''',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "FatCheeks-Regular",
                                                fontFamilyFallback: [
                                                  "Montserrat-Regular"
                                                ],
                                                color: Color(0xFF111111)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: Text(
                                            '''We\'re not just for food, if you are a retailer of any kind we\'d love to hear from you.''',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "FatCheeks-Regular",
                                                fontFamilyFallback: [
                                                  "Montserrat-Regular"
                                                ],
                                                color: Color(0xFF111111)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: RichText(
                                        text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFF111111)),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "For more info, drop us a line to  or use the Calendly link below to schedule a chat. ",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.normal,
                                                  // color: Colors.black54
                                                )),
                                            TextSpan(
                                                text: "hello@vegiapp.co.uk",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: themeShade1200)),
                                            TextSpan(
                                                text:
                                                    " or use the Calendly link below to schedule a chat.",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.normal,
                                                  // color: Colors.black54
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // todo: Are we able to refactor this to a function if children are same for both large and small screen?
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Card(
                          color: themeAccent200,
                          child: Container(
                              // height: 200,
                              width: viewWidth * (isLargeScreen ? 0.45 : 0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Shop vegan on vegi',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "FatCheeks-Regular",
                                            fontFamilyFallback: [
                                              "Montserrat-Regular"
                                            ],
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      child: RichText(
                                        text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFF111111)),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "vegi is an app with exclusively ",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.normal,
                                                  // color: Colors.black54
                                                )),
                                            TextSpan(
                                                text: "vegan",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: themeAccent600)),
                                            TextSpan(
                                                text: ' products.',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.normal,
                                                  // color: Colors.black54
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: RichText(
                                            text: TextSpan(
                                              text: '',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Color(0xFF111111)),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "Think groceries, veg boxes & takeaways from all your favourite ",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      // color: Colors.black54
                                                    )),
                                                TextSpan(
                                                    text: "independents",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: themeShade1200)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: Text(
                                            '''You can collect, or if you\'re in Liverpool you can get a delivery from our zero-carbon cyclist courier partners Agile''',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "FatCheeks-Regular",
                                                fontFamilyFallback: [
                                                  "Montserrat-Regular"
                                                ],
                                                color: Color(0xFF111111)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Card(
                          color: themeShade200,
                          child: Container(
                              // height: 200,
                              width: viewWidth * (isLargeScreen ? 0.45 : 0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Sell vegan on vegi',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "FatCheeks-Regular",
                                            fontFamilyFallback: [
                                              "Montserrat-Regular"
                                            ],
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      child: Text(
                                        '''If you sell plant-based products, you can sell on vegi!''',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "FatCheeks-Regular",
                                            fontFamilyFallback: [
                                              "Montserrat-Regular"
                                            ],
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: Text(
                                            '''vegi makes it easy for plant-based entrepreneurs and seasoned business professionals to reach a vegan-ish audience''',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "FatCheeks-Regular",
                                                fontFamilyFallback: [
                                                  "Montserrat-Regular"
                                                ],
                                                color: Color(0xFF111111)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minWidth: 28),
                                        child: IntrinsicWidth(
                                          child: Text(
                                            '''We\'re not just for food, if you are a retailer of any kind we\'d love to hear from you.''',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "FatCheeks-Regular",
                                                fontFamilyFallback: [
                                                  "Montserrat-Regular"
                                                ],
                                                color: Color(0xFF111111)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                      child: Text(
                                        '''For more info, drop us a line to hello@vegiapp.co.uk or use the Calendly link below to schedule a chat.''',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "FatCheeks-Regular",
                                            fontFamilyFallback: [
                                              "Montserrat-Regular"
                                            ],
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
