import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        apiKey: 'AIzaSyDg5GfOmBR_gYVSEws6pLd1A8P78d6PysI',
        appId: '1:526129377:ios:69d1fac6f1aad59370bfa0',
        messagingSenderId: '526129377',
        projectId: 'vegiliverpool',
        iosBundleId: 'com.vegi.vegiapp',
      );
    } else {
      // Android
      return const FirebaseOptions(
          apiKey: "AIzaSyD39sRS-5q-29cAOL1QVMVmwcs13-ZJYNQ",
          appId: "1:194194217416:web:1e344cff812b1bfd0508fd",
          messagingSenderId: "194194217416",
          authDomain: "grept-site.firebaseapp.com",
          projectId: "grept-site",
          storageBucket: "grept-site.appspot.com",
          measurementId: "G-QB2WLSQD3C");
    }
  }
}
