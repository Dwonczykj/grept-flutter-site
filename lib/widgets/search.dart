import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/state_managers/app_state_manager.dart';
import 'package:webapp/utils/colors_palette.dart';

import '../utils/responsiveLayout.dart';
import 'sendbtn.dart';

class Search extends StatefulWidget {
  TextEditingController emailController;

  Search({
    required this.emailController,
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
                          label: "Notify",
                          onTap: () async {
                            // final response =
                            //     await widget.dio.post(followLink, data: <String, dynamic>{
                            //   'email_address': widget.email,
                            // });
                            appStateManager.setLoading(true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            final response =
                                await appStateManager.subscribeUser(
                                    email: widget.emailController.text);
                            appStateManager.setLoading(false);
                            String status = 'Registered successfully';
                            if (response.error != '') {
                              status = response.error;
                              setState(() {
                                subscribeError = response.error;
                              });
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              //TODO: Switch to Flushbar
                              SnackBar(content: Text(status)),
                            );
                          },
                        ),
                      ),
                    ],
                  ))));
    });
  }
}
