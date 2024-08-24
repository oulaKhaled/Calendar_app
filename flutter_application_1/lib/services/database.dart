import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/path/api_path.dart';

class Database {
  Future addEvent(Map<String, dynamic> map) async {
    return await FirebaseFirestore.instance
        .collection(ApiPath.Event())
        .doc(map["Id"])
        .set(map);
  }

  Future<QuerySnapshot> GetEvents(String username) async {
    return await FirebaseFirestore.instance
        .collection(ApiPath.Event())
        .where("user", isEqualTo: username)
        .get();
  }
}
