// library vegi_zendesk_plugin;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vegisite/utils/theme.dart';

import 'zendesk_plugin_stub.dart';
// if (dart.library.io) 'zendesk_plugin_io.dart'
// if (dart.library.js) 'zendesk_plugin_web.dart';

//~https://medium.com/flutter-community/conditional-imports-across-flutter-and-web-4b88885a886e

abstract class ChatManager {
  static Future<void> initChatManager(bool mounted) =>
      initChatFunctionality(mounted);

  static void openChatWidget(BuildContext context) => openChat(context);

  static Widget? renderChatButton(BuildContext context) {
    return !kIsWeb
        ? IconButton(
            onPressed: () => ChatManager.openChatWidget(context),
            color: themeAccent600,
            icon: Icon(Icons.chat),
            focusColor: themeAccent300,
            iconSize: 30,
          )
        : null;
  }

  // Future<void> initChat(bool mounted) async {
  //   return initChatFunctionality(
  //       mounted); // it will either resolve for the web or io implementation at compile time
  // }

  // Future<void> openChatWindow() async {
  //   return openChat(); // it will either resolve for the web or io implementation at compile time
  // }
}
