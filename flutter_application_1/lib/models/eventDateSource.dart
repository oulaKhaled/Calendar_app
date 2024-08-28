import 'package:flutter_application_1/models/models.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDatasource extends CalendarDataSource {
  EventDatasource(List<Event> appointments) {
    this.appointments = appointments;
  }
  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) {
    return getEvent(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    // TODO: implement getEndTime
    return getEvent(index).to;
  }

  @override
  String getSubject(int index) {
    // TODO: implement getSubject
    return getEvent(index).title;
  }

  // @override
  // String? getNotes(int index) {
  //   // TODO: implement getNotes
  //   return getEvent(index).description;
  // }
}
