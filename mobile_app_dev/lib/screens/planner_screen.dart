import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

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
    return TimePlanner(
      // time will be start at this hour on table
      startHour: 6,
      // time will be end at this hour on table
      endHour: 23,
      // each header is a column and a day
      // TODO: Set date using DateTime object.
      headers: [
        TimePlannerTitle(
          date: "3/10/2021",
          title: "sunday",
        ),
        TimePlannerTitle(
          date: "3/11/2021",
          title: "monday",
        ),
        TimePlannerTitle(
          date: "3/12/2021",
          title: "tuesday",
        ),
      ],
      // List of task will be show on the time planner
      tasks: tasks,
    );
  }
}