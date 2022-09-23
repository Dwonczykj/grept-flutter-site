import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegisite/constants.dart';
import 'package:vegisite/models/subscription_result.dart';
import 'package:vegisite/services/services.dart';
import 'package:vegisite/utils/fire_auth.dart';
import 'package:vegisite/utils/firestore_handles.dart';
import 'package:vegisite/utils/responsiveLayout.dart';
import 'package:vegisite/utils/validator.dart';

class AppStateManager extends ChangeNotifier {
  // String userEmail = '';
  bool isRegistered = false;
  bool appLoading = false;
  final SharedPreferences prefs;
  bool _loggedIn = false;
  // bool showingVegiApp = false;
  GlobalKey smallVegiKey;
  GlobalKey largeVegiKey;
  GlobalKey smallVegiPayKey;
  GlobalKey largeVegiPayKey;

  AppStateManager(
    this.prefs, {
    required this.smallVegiKey,
    required this.largeVegiKey,
    required this.smallVegiPayKey,
    required this.largeVegiPayKey,
  }) {
    loggedIn = prefs.getBool(loggedInKey) ?? false;
  }

  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    prefs.setBool(loggedInKey, value);
    notifyListeners();
  }

  Future<void> checkLoggedIn() async {
    loggedIn = prefs.getBool(loggedInKey) ?? await _fireAuthLogIn();
  }

  Future<bool> _fireAuthLogIn() async {
    final firebaseUser = await FireAuth.firebaseSignIn();
    return firebaseUser != null;
  }

  GlobalKey vegiKey(BuildContext context) {
    if (ResponsiveLayout.isSmallScreen(context)) {
      return smallVegiKey;
    } else if (ResponsiveLayout.isLargeScreen(context)) {
      return largeVegiKey;
    } else {
      return largeVegiKey;
    }
  }

  GlobalKey vegiPayKey(BuildContext context) {
    if (ResponsiveLayout.isSmallScreen(context)) {
      return smallVegiPayKey;
    } else if (ResponsiveLayout.isLargeScreen(context)) {
      return largeVegiPayKey;
    } else {
      return largeVegiPayKey;
    }
  }

  Future<void> sendSlackMessage(String message) async {
    return slackMessagingService.sendMessage(message);
  }

  Future<SubscriptionResult> subscribeUser({
    required String email,
  }) async {
    final invalid = Validator.validateEmail(email: email);
    if (invalid != null) {
      return SubscriptionResult(email: email, error: invalid);
    }

    final manager = VegiSubscribersManager();
    final userEmail = email.toLowerCase().trim();
    try {
      final subscriber = await manager.getSubscriber(email: userEmail);

      if (subscriber != null) {
        isRegistered = true;
        loggedIn = true;
        return SubscriptionResult.userAlreadyExists(userEmail);
      }
    } catch (err) {
      print(
          'Error checking for existing emails: $err'); //REMOVE THE ZENDESK PLUGIN IF FIREBASE PLATFORM NOT WEB
    }

    try {
      final addSubscriber = await manager.addSubscriber(email: userEmail);
      sendSlackMessage("New User: $userEmail registered to mailing list.");
    } catch (err) {
      //TODO-SENTRY Logging
      print('Error adding subscriber: $err');
      isRegistered = false;
      return SubscriptionResult(error: '$err', email: userEmail);
    }

    isRegistered = true;
    loggedIn = true;
    return SubscriptionResult(email: userEmail);
  }

  Future<SubscriptionResult> unsubscribeUser() async {
    final userEmail =
        FirebaseAuth.instance.currentUser?.email?.toLowerCase().trim();
    try {
      if (userEmail == null)
        return SubscriptionResult.userNotSubscribed('Empty User');
      final manager = VegiSubscribersManager();
      final subscriber = await manager.getSubscriber(email: userEmail);

      if (subscriber == null) {
        isRegistered = false;
        loggedIn = false;
        return SubscriptionResult.userNotSubscribed(userEmail);
      }

      await manager.removeThisUser();
    } catch (err) {
      print('Error: $err');
    }

    isRegistered = false;
    loggedIn = false;
    return SubscriptionResult(email: userEmail!);
  }

  void setLoading(bool loading) {
    appLoading = loading;
  }

  void showVegi(BuildContext context) {
    // showingVegiApp = true;
    if (ResponsiveLayout.isSmallScreen(context) &&
        smallVegiKey.currentContext != null) {
      Scrollable.ensureVisible(smallVegiKey.currentContext!);
    } else if (largeVegiKey.currentContext != null) {
      Scrollable.ensureVisible(largeVegiKey.currentContext!);
    }
  }

  // final smallVegiKey = GlobalKey(debugLabel: 'SmallChild-Vegi-TitleText');

  // void hideVegi() {
  //   showingVegiApp = false;
  // }
}
