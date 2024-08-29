import 'dart:async';

import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/controllers/event_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:flutter_application_1/utils.dart';
import '../models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class EventEdit extends StatefulWidget {
  final Event? event;

  const EventEdit({super.key, this.event});

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  // variable that will be initialized later, but is guaranteed to be initialized before it is accessed.
  late DateTime fromDate;
  late DateTime toDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _titleController = TextEditingController();
  final _descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Title",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(20),
                      filled: true,
                      fillColor: Colors.grey[200],

                      hintText: 'title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  buildDate(),
                  Text("Description"),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: TextField(
                      expands: true,
                      minLines: null,
                      maxLines: null,
                      controller: _descriptioncontroller,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            EventController().AddEventController(
                                fromDate,
                                toDate,
                                _descriptioncontroller.text,
                                _titleController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                            backgroundColor: pinkColor,
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              width: 2,
                              color: pinkColor,
                            ),
                          ),
                          child: Text(
                            "Close",
                            style: TextStyle(color: pinkColor),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDate() {
    return Column(
      children: [buildFrom(), buildTo()],
    );
  }

  Widget buildFrom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "From",
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: buildDropDownField(
                    text: Utils.toDate(fromDate),
                    onClicked: () {
                      pickFromDateTime(pickDate: true);
                    })),
            Expanded(
                flex: 2,
                child: buildDropDownField(
                    text: Utils.toTime(fromDate),
                    onClicked: () {
                      pickFromDateTime(pickDate: false);
                    })),
          ],
        ),
      ],
    );
  }

  Widget buildTo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "To",
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: buildDropDownField(
                    text: Utils.toDate(toDate),
                    onClicked: () {
                      pickToDateTime(pickDate: true);
                    })),
            Expanded(
                flex: 2,
                child: buildDropDownField(
                    text: Utils.toTime(toDate),
                    onClicked: () {
                      pickToDateTime(pickDate: false);
                    })),
          ],
        ),
      ],
    );
  }

  Widget buildDropDownField(
          {required String text, required VoidCallback onClicked}) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    setState(() {
      fromDate = date;
    });
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, date.hour, date.minute);
    }
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    setState(() {
      toDate = date;
    });
    // if (toDate.isBefore(fromDate))

    // fromDate =
    //     DateTime(date.year, date.month, date.day, date.hour, date.minute);
  }

  Future<DateTime?> pickDateTime(DateTime initalDate,
      {required bool pickDate, DateTime? firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
          firstDate: firstDate ?? DateTime(2021, 8),
          context: context,
          initialDate: initalDate,
          lastDate: DateTime(2101));
      if (date == null) {
        return null;
      }

      final time = Duration(hours: initalDate.hour, minutes: initalDate.minute);
      return date.add(time);
    } else {
      final timeofDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initalDate));

      if (timeofDay == null) {
        return null;
      }

      final date = DateTime(initalDate.year, initalDate.month, initalDate.day);
      final time = Duration(hours: timeofDay.hour, minutes: timeofDay.minute);
      return date.add(time);
    }
  }
}
