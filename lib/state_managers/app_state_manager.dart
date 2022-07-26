import 'package:flutter/material.dart';
import 'package:webapp/models/subscriber.dart';
import 'package:webapp/models/subscription_result.dart';
import 'package:webapp/utils/firestore_handles.dart';
import 'package:webapp/utils/validator.dart';

class AppStateManager extends ChangeNotifier {
  String userEmail = '';
  bool isRegistered = false;
  bool appLoading = false;

  Future<SubscriptionResult> subscribeUser({
    required String email,
  }) async {
    final valid = Validator.validateEmail(email: email);
    if (valid != null) {
      return SubscriptionResult(email: email, error: valid);
    }

    userEmail = email;
    try {
      final subscriberExistsSnapshot = await subscribers_collection()
          .where('email', isEqualTo: email.toLowerCase())
          .get();

      if (subscriberExistsSnapshot.size > 0) {
        isRegistered = true;
        return SubscriptionResult.userAlreadyExists(email);
      }

      final addSubscriber = await subscribers_collection()
          .add(Subscriber(email: email.toLowerCase()).toJson());
    } catch (err) {
      print('Error: $err');
    }

    isRegistered = true;

    return SubscriptionResult(email: email.toLowerCase());
  }

  Future<SubscriptionResult> unsubscribeUser({
    required String email,
  }) async {
    try {
      final subscriberExistsSnapshot = await subscribers_collection()
          .where('email', isEqualTo: email.toLowerCase())
          .get();
      userEmail = email;
      if (subscriberExistsSnapshot.size == 0) {
        isRegistered = false;
        return SubscriptionResult.userNotSubscribed(email);
      }

      subscriberExistsSnapshot.docs.forEach((doc) {
        subscribers_collection().doc(doc.id).delete();
      });
    } catch (err) {
      print('Error: $err');
    }

    isRegistered = false;

    return SubscriptionResult(email: email.toLowerCase());
  }

  void setLoading(bool loading) {
    appLoading = loading;
  }
}
