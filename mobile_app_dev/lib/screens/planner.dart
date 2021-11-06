import 'package:flutter/cupertino.dart';

import '../main.dart';

class PlannerPage extends StatefulWidget {
  @override
  _PlannerPageState createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(0, Text('Your Planner'), Text('The Planner'));
  }
}
