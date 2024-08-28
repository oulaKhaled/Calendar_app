import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Event {
  final String Id;
  final String user;
  final String title;
  final String description;

  final DateTime from;
  final DateTime to;
  final Color backgroundColor;

  Event({
    required this.Id,
    required this.user,
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backgroundColor = pinkColor,
  });

  Map<String, dynamic> ToMap() {
    return {
      "Id": Id,
      "user": user,
      "title": title,
      "description": description,
      "from": from,
      "to": to,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map, String documentId) {
    return Event(
      Id: documentId,
      user: map["user"] as String,
      title: map["title"] as String,
      description: map["description"] as String,
      from: (map["from"] as Timestamp).toDate(),
      to: (map["to"] as Timestamp).toDate(),
    );
  }
}
