import 'package:flutter/material.dart';
import 'package:webapp/models/subscriber.dart';
import 'package:webapp/models/subscription_result.dart';
import 'package:webapp/utils/firestore_handles.dart';
import 'package:webapp/utils/responsiveLayout.dart';
import 'package:webapp/utils/validator.dart';

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
        return SubscriptionResult.userAlreadyExists(userEmail);
      }
    } catch (err) {
      print('Error checking for existing emails: $err');
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
