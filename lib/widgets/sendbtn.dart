import 'package:flutter/material.dart';
import 'package:webapp/utils/colors_palette.dart';

import '../utils/responsiveLayout.dart';

class SendBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color6,
              color5,
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: color4.withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:
                () {}, //TODO: Connect this button to HubSpot (https://app.hubspot.com/signup-hubspot/marketing?intent=marketingFreeEmail&skip_setup=true&opt_sidebar=marketing-free&irclickid=zVSzz1VFPzsTWc8SWDQiBV8cUkDzHE27l1GJ2U0&irgwc=1&mpid=11535&utm_id=am11535&utm_medium=am&utm_source=am11535&utm_campaign=amcid_zVSzz1VFPzsTWc8SWDQiBV8cUkDzHE27l1GJ2U0_irpid_11535&hubs_signup-url=www.hubspot.com%2Fmarketing%2Ffree%2Fam-free-email&hubs_signup-cta=Get+started+-+it%27s+free&_ga=2.106527302.415137306.1655802688-1888506648.1655802688&step=company_domain)
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Notify",
                      style: TextStyle(
                          color: color4,
                          fontFamily: "Montserrat-Bold",
                          fontSize: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 16,
                          letterSpacing: 1.0)),
                  SizedBox(
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? 4
                        : ResponsiveLayout.isMediumScreen(context)
                            ? 6
                            : 8,
                  ),
                  Image.network(
                    "assets/icons8-paper_plane.png",
                    color: color4,
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? 12
                        : ResponsiveLayout.isMediumScreen(context)
                            ? 12
                            : 30,
                    height: ResponsiveLayout.isSmallScreen(context)
                        ? 12
                        : ResponsiveLayout.isMediumScreen(context)
                            ? 12
                            : 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
