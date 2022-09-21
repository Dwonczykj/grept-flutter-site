import 'package:cloud_firestore/cloud_firestore.dart';

class firebase_collections {
  static const String subscribers = "subscribers";
}

CollectionReference<Map<String, dynamic>> subscribers_collection() =>
    FirebaseFirestore.instance.collection(firebase_collections.subscribers);
