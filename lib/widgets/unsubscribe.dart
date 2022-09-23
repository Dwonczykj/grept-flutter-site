import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart';

import '../utils/responsiveLayout.dart';
import 'sendbtn.dart';

class Unsubscribe extends StatefulWidget {
  TextEditingController emailController;

  Unsubscribe({
    required this.emailController,
  });

  @override
  State<Unsubscribe> createState() => _UnsubscribeState();
}

class _UnsubscribeState extends State<Unsubscribe> {
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
                              hintText: 'Your Email Address',
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
                          disabled: (widget.emailController.text == ""),
                          label: "Unsubscribe",
                          onTap: () async {
                            // final response =
                            //     await widget.dio.post(followLink, data: <String, dynamic>{
                            //   'email_address': widget.email,
                            // });
                            final response =
                                await appStateManager.unsubscribeUser(
                                    email: widget.emailController.text);
                            if (response.error != '') {
                              setState(() {
                                subscribeError = response.error;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ))));
    });
  }
}
