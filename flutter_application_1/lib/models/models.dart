import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class myUser {
  final String userId;
  final String name;
  final String account;
  final String location;

  myUser(
      {required this.userId,
      required this.account,
      required this.name,
      required this.location});

  Map<String, dynamic> ToMap() {
    return {
      "userId": userId,
      "name": name,
      "accounts": account,
      "location": location,
    };
  }

  factory myUser.fromMap(Map<String, dynamic> map, String documentId) {
    return myUser(
      userId: documentId,
      name: map["name"] as String,
      account: map["account"] as String,
      location: map["location"] as String,
    );
  }
}

class Event {
  final String Id;
  final String user;
  final String title;
  final String description;
  final String? type;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;

  Event({
    required this.Id,
    required this.user,
    required this.title,
    required this.description,
    this.type,
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
      "type": type,
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
        type: map["TYPE"] as String,
        from: map["from"],
        to: map["to"]);
  }
}
