import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vegisite/utils/theme.dart';
import 'package:zendesk_plugin/zendesk_plugin.dart';

import 'zendesk_plugin.dart';

class ChatManagerWeb extends ChatManager {
  Future<void> initChatFunctionality(bool mounted) async {
    if (!mounted) {
      return;
    }
    await Zendesk.initialize('', '');
  }

  Future<void> openChat(BuildContext context) async {
    String clientName = '<unknown client>';
    try {
      if (Platform.isIOS) {
        clientName = 'iphone';
      }
      if (Platform.isAndroid) {
        clientName = 'Android';
      }
      await Zendesk.setVisitorInfo(
          name: 'Chat Client on $clientName',
          email: 'test+client@example.com',
          phoneNumber: '0000000000',
          department: 'vegi-Support');
      await Zendesk.startChat(primaryColor: themeShade400);
    } on dynamic catch (ex) {
      print('An error occured $ex');
    }
  }
}
