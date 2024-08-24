import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/event_controller.dart';
import 'dart:ffi';

import 'package:flutter_application_1/pages/eventEditing.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:flutter_application_1/services/database.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  List<QueryDocumentSnapshot> events = [];

  _getData() async {
    events = await EventController().GetEventsController()
        as List<QueryDocumentSnapshot>;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 160),
            itemBuilder: (context, i) {
              return Text("${events[i]["title"]}");
            }));
  }
}
