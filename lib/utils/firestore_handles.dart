import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegisite/constants.dart';
import 'package:vegisite/firebase_options.dart';
import 'package:vegisite/models/subscriber.dart';
import 'package:vegisite/models/subscription_result.dart';

class firebase_collections {
  static const String subscribers = "subscribers";
}

class VegiSubscribersManager {
  Future<SubscriptionResult> addSubscriber({required String email}) async {
    var emailAuth = email;
    var acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: '$vegiAppSiteUrl/$finishSignUp', //?cartId=1234
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: DefaultFirebaseOptions.ios.iosBundleId,
        androidPackageName: androidPackageName,
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '21');
    //TODO: sendConfirmationEmail to user to verifyEmail and then flag the email as verified in firebase;
    await FirebaseAuth.instance
        .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
        .catchError(
            (onError) => print('Error sending email verification $onError'));
    final fbUser = FirebaseAuth.instance.currentUser;
    if (fbUser == null || fbUser.email == null) {
      return SubscriptionResult.userNotSubscribed(email);
    }
    return SubscriptionResult(email: email);
    // subscribers_collection
    //     .add(Subscriber(email: email, isVerified: false).toJson());
  }

  Future<void> removeThisUser() async {
    FirebaseAuth.instance.currentUser?.delete();

    // final subscriberExistsSnapshot = await manager.getSubscriber(email: userEmail);
    // subscriberExistsSnapshot.docs.forEach((doc) {
    //   subscribers_collection().doc(doc.id).delete();
    // });
  }

  Future<Subscriber?> getSubscriber({required String email}) async {
    final response = await addSubscriber(email: email);
    if (response.error.isNotEmpty || response.email.isEmpty) {
      return null;
    }
    final user = FirebaseAuth.instance.currentUser;
    return user != null
        ? Subscriber(email: user.email!, isVerified: user.emailVerified)
        : null;

    // return subscribers_collection()
    //     .where('email', isEqualTo: userEmail)
    //     .where('isVerified', isEqualTo: true)
    //     .get().size > 0;
  }

  // CollectionReference<Map<String, dynamic>> get subscribers_collection =>
  //     FirebaseFirestore.instance.collection(firebase_collections.subscribers);
}
