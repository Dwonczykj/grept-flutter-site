import 'package:flutter/material.dart';
import 'package:vegisite/models/subscriber.dart';
import 'package:vegisite/models/subscription_result.dart';
import 'package:vegisite/services/services.dart';
import 'package:vegisite/utils/firestore_handles.dart';
import 'package:vegisite/utils/responsiveLayout.dart';
import 'package:vegisite/utils/validator.dart';

class AppStateManager extends ChangeNotifier {
  // String userEmail = '';
  bool isRegistered = false;
  bool appLoading = false;
  // bool showingVegiApp = false;
  GlobalKey smallVegiKey;
  GlobalKey largeVegiKey;

  AppStateManager({
    required this.smallVegiKey,
    required this.largeVegiKey,
  });

  GlobalKey vegiKey(BuildContext context) {
    if (ResponsiveLayout.isSmallScreen(context)) {
      return smallVegiKey;
    } else if (ResponsiveLayout.isLargeScreen(context)) {
      return largeVegiKey;
    } else {
      return largeVegiKey;
    }
  }

  Future<void> sendSlackMessage(String message) async {
    return slackMessagingService.sendMessage(message);
  }

  Future<SubscriptionResult> subscribeUser({
    required String email,
  }) async {
    final valid = Validator.validateEmail(email: email);
    if (valid != null) {
      return SubscriptionResult(email: email, error: valid);
    }

    final userEmail = email.toLowerCase().trim();
    try {
      final subscriberExistsSnapshot = await subscribers_collection()
          .where('email', isEqualTo: userEmail)
          .get();

      if (subscriberExistsSnapshot.size > 0) {
        isRegistered = true;
        sendSlackMessage("New User: $userEmail registered to mailing list.");
        return SubscriptionResult.userAlreadyExists(userEmail);
      }
    } catch (err) {
      print(
          'Error checking for existing emails: $err'); //REMOVE THE ZENDESK PLUGIN IF FIREBASE PLATFORM NOT WEB
    }

    try {
      final addSubscriber = await subscribers_collection()
          .add(Subscriber(email: userEmail).toJson());
    } catch (err) {
      //TODO-SENTRY Logging
      print('Error adding subscriber: $err');
      isRegistered = false;
      return SubscriptionResult(error: '$err', email: userEmail);
    }

    isRegistered = true;

    return SubscriptionResult(email: userEmail);
  }

  Future<SubscriptionResult> unsubscribeUser({
    required String email,
  }) async {
    final userEmail = email.toLowerCase().trim();
    try {
      final subscriberExistsSnapshot = await subscribers_collection()
          .where('email', isEqualTo: email.toLowerCase())
          .get();
      if (subscriberExistsSnapshot.size == 0) {
        isRegistered = false;
        return SubscriptionResult.userNotSubscribed(userEmail);
      }

      subscriberExistsSnapshot.docs.forEach((doc) {
        subscribers_collection().doc(doc.id).delete();
      });
    } catch (err) {
      print('Error: $err');
    }

    isRegistered = false;

    return SubscriptionResult(email: userEmail);
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
