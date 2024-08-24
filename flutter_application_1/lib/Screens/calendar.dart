import 'dart:ffi';
import 'dart:math';
import 'package:flutter_application_1/models/eventDateSource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_application_1/controllers/event_controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // String currentuser = Auth().getCurrentUserName();
  // _getData() async {
  //   return await Database().GetEvents(currentuser) as List<Event>;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            height: 700,
            margin: EdgeInsets.all(12),
            width: double.infinity,
            child: SfCalendar(
              view: CalendarView.month,
              // dataSource: EventDatasource(_getData()),
              initialSelectedDate: DateTime.now(),
            ),
          ),
          // Container(
          //   height: 400,
          //   width: double.infinity,
          //   child: TimeSlotScreen(),
          // )
        ],
      ),
    );
  }
}

class TimeSlotScreen extends StatelessWidget {
  // Generate a list of time slots from 8 AM to 11 PM
  List<String> _generateTimeSlots() {
    List<String> timeSlots = [];
    TimeOfDay startTime = TimeOfDay(hour: 8, minute: 0);
    TimeOfDay endTime = TimeOfDay(hour: 23, minute: 0);

    while (startTime.hour < endTime.hour) {
      String formattedTime = _formatTimeOfDay(startTime);
      timeSlots.add(formattedTime);

      // Increment by 1 hour
      startTime = startTime.replacing(hour: startTime.hour + 1);
    }

    return timeSlots;
  }

  // Format TimeOfDay to a readable string
  String _formatTimeOfDay(TimeOfDay time) {
    final hours = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hours.toString().padLeft(2, '0')}:00 $period';
  }

  @override
  Widget build(BuildContext context) {
    final timeSlots = _generateTimeSlots();

    return Scaffold(
      body: Container(
        height: 400,
        width: double.infinity,
        child: ListView.builder(
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(children: [
                    Text(
                      timeSlots[index],
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.blueGrey[300]),
                    ),

                    Container(
                      height: 2.0,
                      width: 200, // Set the height of the line
                      color: Colors.blueGrey[300], // Set the color of the line
                      margin: EdgeInsets.symmetric(
                          horizontal: 60.0), // Optional padding
                    )
                    // Optional padding
                  ]),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectDay; //Declare selected day as nullable
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2024, 7, 1),
      lastDay: DateTime.utc(2026, 8, 1),

      selectedDayPredicate: (day) => isSameDay(
          _selectDay, day), //it will only retun fals if _selectedday is null
      onDaySelected:
          _oneDaySelected, //checks if the selected day is different from the currently selected day./
      calendarFormat: _calendarFormat,
      // onFormatChanged: _onFormatChange,
      headerStyle: HeaderStyle(
        headerPadding: EdgeInsets.only(left: 10, top: 40, bottom: 5),
        leftChevronVisible: false,
        rightChevronVisible: false,
        rightChevronIcon: Icon(Icons.arrow_drop_down),
        rightChevronMargin: EdgeInsets.only(right: 250),
        formatButtonVisible: false,
        titleTextStyle:
            GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 20),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: GoogleFonts.poppins(color: Colors.blueGrey[200]),
          weekendStyle: GoogleFonts.poppins(color: Colors.blueGrey[200])),
      calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: pinkColor,
          ),
          selectedDecoration:
              BoxDecoration(color: Colors.pink[50], shape: BoxShape.circle),
          selectedTextStyle: GoogleFonts.poppins(
              color: pinkColor, fontWeight: FontWeight.bold)),
    );
  }

  _oneDaySelected(selectDay, focuseday) {
    if (!isSameDay(_selectDay, selectDay)) {
      setState(() {
        _selectDay = selectDay;
        _focusedDay = focuseday;
      });
    }
  }
}
