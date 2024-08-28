import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/path/api_path.dart';
import 'package:flutter_application_1/services/authentication.dart';

class Database {
  final _currentuser = Auth().getCurrentUserEmail();
  Future addEvent(Map<String, dynamic> map) async {
    return await FirebaseFirestore.instance
        .collection(ApiPath.Event())
        .doc(map["Id"])
        .set(map);
  }

  Future<Stream<QuerySnapshot>> GetEvents(String userEmail) async {
    return await FirebaseFirestore.instance
        .collection(ApiPath.Event())
        .snapshots();
  }
}
  // Future<List<Map<String, dynamic>>> GetEvents(String user) async {
  //   Stream<QuerySnapshot> snapshot = await FirebaseFirestore.instance
  //       .collection(ApiPath.Event())
  //       .where("email", isEqualTo: user)
  //       .snapshots();

  //   List<Map<String, dynamic>> maps = [];
  //   snapshot.map((e) {
  //     e.docs.map((element) {
  //       maps.add(element.data() as Map<String, dynamic>);
  //     });
  //   });

  //   return maps;
  // }















  // Future<List<QuerySnapshot>> GetEvents(String username) async {
  //   List<QuerySnapshot> events = [];
  //   QuerySnapshot snapshot1 =
  //       await FirebaseFirestore.instance.collection('users').get();
  //   events.add(snapshot1);
  //   return events;
  // }
