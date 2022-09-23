import 'package:flutter/material.dart';
import 'package:vegisite/utils/colors_palette.dart';

import '../utils/responsiveLayout.dart';

class SendBtn extends StatefulWidget {
  final void Function() onTap;
  final String label;

  bool disabled;

  SendBtn({
    Key? key,
    required this.onTap,
    required this.label,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<SendBtn> createState() => _SendBtnState();
}

class _SendBtnState extends State<SendBtn> {
  MouseCursor? mouseCursor = SystemMouseCursors.basic;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disabled,
      child: Container(
        foregroundDecoration: widget.disabled
            ? BoxDecoration(
                //this can make disabled effect
                color: Colors.grey,
                backgroundBlendMode: BlendMode.lighten)
            : null,
        child: InkWell(
          onTap: () {
            print('Parent INK Tapped...');
          },
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
                onTap: () {
                  print('child INK tapped');
                  widget.onTap();
                },
                onHover: (hovering) {
                  if (hovering && widget.disabled) {
                    setState(() {
                      mouseCursor = SystemMouseCursors.basic;
                    });
                  } else if (!hovering &&
                      mouseCursor != SystemMouseCursors.basic) {
                    setState(() {
                      mouseCursor = SystemMouseCursors.forbidden;
                    });
                  }
                },
                mouseCursor: mouseCursor,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${widget.label}",
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
        ),
      ),
    );
  }
}
