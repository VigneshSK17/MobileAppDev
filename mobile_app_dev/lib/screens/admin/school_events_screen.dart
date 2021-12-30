import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dev/widgets/home_calendar.dart';

class SchoolEventsScreen extends StatefulWidget {
  @override
  _SchoolEventsScreenState createState() => _SchoolEventsScreenState();
}

class _SchoolEventsScreenState extends State<SchoolEventsScreen> {

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  // TODO: Implement the calendars
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
              top: deviceHeight(context) * 0.02,
              left: deviceWidth(context) * 0.09,
              right: deviceWidth(context) * 0.09,
              bottom: deviceHeight(context) * 0.06,
            ),
            child: Column(
                children: [
                  Text(
                      'School Event Calendar',
                    style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)),
                  homeCalendar(context),
                  const SizedBox(height: 16),
                  ListView(
                    children: [
                      ExpansionTile(
                        title: Text('Add Event'),
                      ),
                      ExpansionTile(
                        title: Text('Edit Events'),
                      ),
                      ExpansionTile(
                        title: Text('Delete Events'),
                      )
                    ],
                  )
                ]
            )
        )
      )
    );
  }

}