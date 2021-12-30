import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mobile_app_dev/helperFunctions/planner_events.dart';
import 'package:mobile_app_dev/widgets/planner/event_screen.dart';


class AddEventsWidget extends StatelessWidget {

  BuildContext context;

  AddEventsWidget(this.context);

  @override
  Widget build(BuildContext context) {
    // TextStyle? textStyle = Theme.of(context).textTheme.bodyText1);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: EventScreen(Events()),
    );
  }
  
}