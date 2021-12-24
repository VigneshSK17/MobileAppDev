import 'package:flutter/material.dart';
import 'package:mobile_app_dev/helperFunctions/planner_events.dart';
import 'package:mobile_app_dev/widgets/planner/planner_fab.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PlannerScreen2 extends StatefulWidget {

  @override
  _PlannerScreen2State createState() => _PlannerScreen2State();
}

class _PlannerScreen2State extends State<PlannerScreen2> {

  DateTime now = DateTime.now();
  Events userEvents = Events();

  @override
  Widget build(BuildContext context) {
    userEvents.addEvent(Event("Conference", DateTime.now(), DateTime.now(), Colors.red, true));
    return Scaffold(
      body: SafeArea(
        child: SfCalendar(
          cellBorderColor: Theme.of(context).primaryColor,
          todayHighlightColor: Theme.of(context).primaryColor,
          dataSource: EventDataSource(userEvents.getEvents()),
        )
      ),
      // Firebase: Pass through user info
      floatingActionButton: PlannerFab(userEvents, context),
    );
  }


  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
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

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}