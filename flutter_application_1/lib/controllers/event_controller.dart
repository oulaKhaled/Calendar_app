import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:flutter_application_1/services/database.dart';

class EventController {
  String currentuser = Auth().getCurrentUserName();

  Future AddEventController(fromDate, toDate, description, title) async {
    String id = randomAlpha(10);

    Event event = Event(
        Id: id,
        user: currentuser,
        title: title,
        description: description,
        from: fromDate,
        to: toDate);
    Map<String, dynamic> myevent = event.ToMap();
    Database().addEvent(myevent);
  }

  Future GetEventsController() async {
    QuerySnapshot data = await Database().GetEvents(currentuser);
    List<QueryDocumentSnapshot> events = [];
    events.addAll(data.docs);

    return events;
  }
}

    // data.listen((QuerySnapshot snapshot) {
    //   // Print the documents
    //   for (var doc in snapshot.docs) {
    //     Event event = Event.fromMap(doc as Map<String, dynamic>, doc["id"]);
    //     events.add(event);
    //   }
    // });