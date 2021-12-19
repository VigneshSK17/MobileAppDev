
import 'package:flutter/material.dart';
import 'package:mobile_app_dev/widgets/planner/event_screen.dart';

import 'fab_dialog_route.dart';

Widget PlannerFab(userInfo, context) {
  return FloatingActionButton(
    tooltip: 'Add new event',
    backgroundColor: Theme.of(context).primaryColor,
    foregroundColor: Theme.of(context).canvasColor,
    splashColor: Theme.of(context).canvasColor,
    child: const Icon(Icons.add),
    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EventScreen(userInfo)

    ))
  );
}