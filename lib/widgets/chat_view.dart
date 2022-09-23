import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vegisite/widgets/chat_bubble.dart';

class UDouble {
  late final double value;
  UDouble(double value, {bool silent = false}) {
    if (value < 0) {
      if (!silent) {
        throw Exception('value of UDouble must be >= 0');
      } else {
        this.value = 0.0;
      }
    }
    this.value = value;
  }
}

class WidgetLocation {
  final double left;
  final double top;
  final UDouble width;
  final UDouble height;
  const WidgetLocation(this.left, this.top, this.width, this.height);
}

class ChatMessage {
  final String text;
  final bool isCurrentUser;
  const ChatMessage({required this.text, required this.isCurrentUser});
}

class ChatOverlay {
  //https://medium.com/saugo360/https-medium-com-saugo360-flutter-using-overlay-to-display-floating-widgets-2e6d0e8decb9

  String chatApiBaseUrl;
  String postMessagePath;
  String? retrieveMessagesPath;
  String? socketPath;
  List<ChatMessage> _messages = [
    ChatMessage(
      text: 'How was the concert?',
      isCurrentUser: false,
    ),
    ChatMessage(
      text: 'Awesome! Next time you gotta come as well!',
      isCurrentUser: true,
    ),
    ChatMessage(
      text: 'Ok, when is the next date?',
      isCurrentUser: false,
    ),
    ChatMessage(
      text: 'They\'re playing on the 20th of November',
      isCurrentUser: true,
    ),
    ChatMessage(
      text: 'Let\'s do it!',
      isCurrentUser: false,
    )
  ];

  ChatOverlay(
      {required this.chatApiBaseUrl,
      required this.postMessagePath,
      this.retrieveMessagesPath,
      this.socketPath});

  OverlayEntry createOverlayEntry(BuildContext context) {
    final viewSize = MediaQuery.of(context).size;
    final chatWidgetWeb = OverlayEntry(builder: ((context) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: 300, minWidth: 200, minHeight: 300),
          height: viewSize.height * 0.5,
          child: _chatWidgetInternal(context),
        ),
      );
    }));

    final chatWidgetMobile = OverlayEntry(builder: ((context) {
      return SafeArea(
        child: _chatWidgetInternal(context),
      );
    }));

    return kIsWeb ? chatWidgetWeb : chatWidgetMobile;
  }

  Widget _chatWidgetInternal(BuildContext context) => Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            // TODO: Convert to stfl changenotify container that contains the messages.
            children: _messages
                .map((m) =>
                    ChatBubble(text: m.text, isCurrentUser: m.isCurrentUser))
                .toList(),
          ),
        ),
      );
}
