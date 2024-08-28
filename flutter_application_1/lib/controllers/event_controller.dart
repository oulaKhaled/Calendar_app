import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:flutter_application_1/services/database.dart';

class EventController {
  String currentuser = Auth().getCurrentUserEmail();

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
    await Database().addEvent(myevent);
  }

  Future<List<Event>> GetEventsController() async {
    List<Event> events = [];
    Stream<QuerySnapshot> data = await Database().GetEvents(currentuser);
    print("CURRETNNNT USERRR : ${currentuser}");
    data.listen((QuerySnapshot e) {
      for (DocumentSnapshot doc in e.docs) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        print("MAAAAPPPPPP : ${map}");
        Event newevent = Event.fromMap(map, map["Id"]);
        print("NEWWWW EVENNNTT : ${newevent}");
        events.add(newevent);
      }
    });
    return events;
  }
}
