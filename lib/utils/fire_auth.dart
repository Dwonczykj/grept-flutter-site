import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vegisite/firebase_options.dart';

class FireAuth {
  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static Future<User?> signInAnonymously() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInAnonymously();
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    return user;
  }

  static Future<User?> firebaseSignIn() async {
    try {
      final user = await FireAuth.signInAnonymously();

      return user;
    } catch (err) {
      print('Error (Unable to signin to firebase anon): $err');
    }
    return null;
  }

  static Future<User?> initializeFirebaseAndSignIn() async {
    await initializeFirebaseApp();
    return firebaseSignIn();
  }

  static Future<FirebaseApp> initializeFirebaseApp() async {
    // final firebaseConfig = DefaultFirebaseConfig.platformOptions;
    final firebaseConfig = DefaultFirebaseOptions.currentPlatform;
    return await Firebase.initializeApp(options: firebaseConfig);
  }
}
