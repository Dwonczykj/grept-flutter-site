import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart';

import '../utils/responsiveLayout.dart';
import 'sendbtn.dart';

class Search extends StatefulWidget {
  TextEditingController emailController;
  String inputHint;
  String buttonLabel;
  Future<String> Function() onSubmit;

  Search({
    required this.emailController,
    required this.onSubmit,
    required this.buttonLabel,
    required this.inputHint,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String subscribeError = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return Padding(
          padding: EdgeInsets.only(
            left: 4.0,
            right: ResponsiveLayout.isSmallScreen(context) ? 4 : 130,
            top: 10,
            bottom: 40,
          ),
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: color4,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 8),
                        blurRadius: 8),
                  ]),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.inputHint,
                              errorStyle: TextStyle(
                                color: Color.fromARGB(255, 244, 14, 14),
                              ),
                              errorText: subscribeError),
                          controller: widget.emailController,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SendBtn(
                          disabled:
                              false, //(widget.emailController.text == ""),
                          label: ResponsiveLayout.isSmallScreen(context)
                              ? ''
                              : widget.buttonLabel,
                          onTap: () async {
                            final error = await widget.onSubmit();
                            setState(() async {
                              subscribeError = error;
                            });
                          },
                        ),
                      ),
                    ],
                  ))));
    });
  }
}
