import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// TODO: Flesh out calendar with easy function for adding events
Widget homeCalendar(var context) {
  return SfCalendar(
      cellBorderColor: Theme.of(context).dividerColor,
      todayHighlightColor: Theme.of(context).secondaryHeaderColor,
      view: CalendarView.month);
}
