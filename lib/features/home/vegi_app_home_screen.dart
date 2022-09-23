import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vegisite/plugins/zendesk_plugin.dart';
import 'package:vegisite/utils/colors_palette.dart';
import 'package:vegisite/utils/fire_auth.dart';
import 'package:vegisite/widgets/navbar.dart';

class VegiPage extends StatefulWidget {
  @override
  State<VegiPage> createState() => _VegiPageState();

  VegiPage({Key? key, required this.appLoading, required this.child})
      : super(key: key);

  final bool appLoading;
  final Widget child;
}

class _VegiPageState extends State<VegiPage> {
  @override
  void initState() {
    super.initState();
    ChatManager.initChatManager(mounted);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
        future: FireAuth.signInAnonymously(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
              // foregroundDecoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: NetworkImage(
              //           'https://p6.storage.canalblog.com/69/50/922142/85510911_o.png'),
              //       fit: BoxFit.fill),
              // ),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       alignment: Alignment(-.2, 0),
              //       opacity: 0.25,
              //       image:
              //           NetworkImage("assets/global_warming_house_fire.jpg"),
              //       fit: BoxFit.cover),
              // ),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFFBFF),
                    color10,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButton: ChatManager.renderChatButton(context),
                body: snapshot.connectionState != ConnectionState.done ||
                        widget.appLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                        children: <Widget>[
                          NavBar(),
                          widget.child,
                          if (widget.appLoading) CircularProgressIndicator(),
                          // if (chatApi.connectionState !=
                          //     ConnectionState.done)
                          //   chatApi.data!.
                        ],
                      )),
              ));
        });
  }
}
