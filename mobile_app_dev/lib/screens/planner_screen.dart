import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app_dev/widgets/planner/planner_fab.dart';
import 'package:time_planner/time_planner.dart';

// Helper Functions

List<TimePlannerTitle> plannerHeaders (DateTime date, var daysToFurthestEvent) {
  List<TimePlannerTitle> titles = [];
  for(var daysPastToday = 0; daysPastToday <= daysToFurthestEvent; daysPastToday++) {
    titles.add(
        TimePlannerTitle(
            date: DateFormat.yMd('en_US').format(DateTime.now().add(Duration(days: daysPastToday))),
            title: DateFormat.E('en_US').format(DateTime.now().add(Duration(days: daysPastToday)))
        )
    );
  }
  return titles;
}


// TODO: Make the planner scalable (make function to add new tasks to planner & make planner based on time)
class PlannerScreen extends StatelessWidget {
  List<TimePlannerTask> tasks = [
    TimePlannerTask(
      // background color for task
      color: Colors.purple,
      // day: Index of header, hour: Task will be begin at this hour
      // minutes: Task will be begin at this minutes
      dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
      // Minutes duration of task
      minutesDuration: 90,
      // Days duration of task (use for multi days task)
      daysDuration: 1,
      onTap: () {},
      child: Text(
        'Math Test',
        style: TextStyle(color: Colors.grey[350], fontSize: 12),
      ),
    ),
    TimePlannerTask(
      // background color for task
      color: Colors.purple,
      // day: Index of header, hour: Task will be begin at this hour
      // minutes: Task will be begin at this minutes
      dateTime: TimePlannerDateTime(day: 1, hour: 7, minutes: 00),
      // Minutes duration of task
      minutesDuration: 90,
      // Days duration of task (use for multi days task)
      daysDuration: 2,
      onTap: () {},
      child: Text(
        'Math Test',
        style: TextStyle(color: Colors.grey[350], fontSize: 12),
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: TimePlanner(
        // time will be start at this hour on table
        startHour: 1,
        // time will be end at this hour on table
        endHour: 23,
        // each header is a column and a day
        // TODO: Set date using DateTime object.
        headers: plannerHeaders(DateTime.now(), 7),
        // List of task will be show on the time planner
        tasks: tasks,
      )),
      floatingActionButton: PlannerFab('blah', context),
    );
  }
}
