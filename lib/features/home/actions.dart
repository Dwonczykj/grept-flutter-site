import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vegisite/models/subscription_result.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';

Future<String> subscribeEmail(
    {required AppStateManager appStateManager,
    required BuildContext context,
    required String email}) async {
  return _submitEmail(
      appStateManager: appStateManager,
      context: context,
      email: email,
      submit: () async {
        return appStateManager.subscribeUser(email: email);
      });
}

Future<String> unsubscribeEmail(
    {required AppStateManager appStateManager,
    required BuildContext context,
    required String email}) async {
  return _submitEmail(
      appStateManager: appStateManager,
      context: context,
      email: email,
      submit: () async {
        assert(email == FirebaseAuth.instance.currentUser?.email);
        return appStateManager.unsubscribeUser();
      });
}

Future<String> _submitEmail({
  required AppStateManager appStateManager,
  required BuildContext context,
  required String email,
  required Future<SubscriptionResult> Function() submit,
}) async {
  // final response =
  //     await widget.dio.post(followLink, data: <String, dynamic>{
  //   'email_address': widget.email,
  // });
  appStateManager.setLoading(true);
  Flushbar(
    duration: Duration(seconds: 2),
    boxShadows: [
      BoxShadow(
        offset: Offset(0.5, 0.5),
        blurRadius: 5,
      ),
    ],
    titleText: Text(
      'Loading',
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    messageText: Text(
      'Processing Email',
      style: TextStyle(
        fontSize: 14.0,
      ),
    ),
    backgroundColor: Theme.of(context).bottomAppBarColor,
    margin: EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 100),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    icon: Icon(
      Icons.pending,
      size: 20,
    ),
  )..show(context);
  // ScaffoldMessenger.of(context).showSnackBar(
  //   const SnackBar(content: Text('Processing Data')),
  // );
  final response = await submit();

  appStateManager.setLoading(false);
  String status = 'Registered successfully';
  String subscribeError = response.error;
  if (response.error != '') {
    status = response.error;
    Flushbar(
      duration: Duration(seconds: 2),
      boxShadows: [
        BoxShadow(
          offset: Offset(0.5, 0.5),
          blurRadius: 5,
        ),
      ],
      titleText: Text(
        status,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        '',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      backgroundColor: Theme.of(context).bottomAppBarColor,
      margin: EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 100),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
      icon: SvgPicture.asset(
        'assets/failed_icon.svg',
        width: 20,
        height: 20,
      ),
    )..show(context);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(status),
    //     backgroundColor: color1,
    //   ),
    // );
  } else {
    Flushbar(
      duration: Duration(seconds: 2),
      boxShadows: [
        BoxShadow(
          offset: Offset(0.5, 0.5),
          blurRadius: 5,
        ),
      ],
      titleText: Text(
        status,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        '',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      backgroundColor: Theme.of(context).bottomAppBarColor,
      margin: EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 100),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
      icon: Icon(Icons.done, size: 20),
    )..show(context);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(status),
    //     backgroundColor: Colors.redAccent[500],
    //   ),
    // );
  }
  return subscribeError;
}
