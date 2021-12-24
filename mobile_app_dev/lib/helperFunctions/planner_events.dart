import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Event {
  Event(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  @override
  String toString() {
    return "($eventName,$from,$to,$background,$isAllDay)";
  }
}

class Events {
  List<Event> events = <Event>[];

  void addEvent(Event newEvent) {
    events.add(newEvent);
  }

  List<Event> getEvents() {
    return events;
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

DateTime makeDateTime(String dateString, TimeOfDay time) {
  return DateTime(int.parse(dateString.substring(0,4)), int.parse(dateString.substring(5,7)), int.parse(dateString.substring(8, 10)), time.hour, time.minute);
}
