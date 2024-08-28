import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/event_controller.dart';
import 'package:flutter_application_1/pages/setProfile.dart';

import 'package:flutter_application_1/services/database.dart';
import 'package:flutter_application_1/pages/eventEditing.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:flutter_application_1/services/database.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String currentuser = Auth().getCurrentUserEmail();
  List<QueryDocumentSnapshot> events = [];
  Future<String> hi() async {
    return await 'Just say Hi ';
  }

  @override
  Widget build(BuildContext context) {
    return Setprofile();
  }
}
// Container(
//         child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, mainAxisExtent: 160),
//             itemCount: events.length,
//             itemBuilder: (context, i) {
//               return Text("${events[i]["title"]} fgdfgd");
// //             }));
// Text(
      
//       hi().then((onValue){
//       print(onValue)
//     }));

  // _getData() async {
  //   QuerySnapshot data = await Database().GetEvents(currentuser);
  //   events.addAll(data.docs);
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _getData();
  // }