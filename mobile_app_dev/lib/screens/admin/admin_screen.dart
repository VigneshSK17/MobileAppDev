import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dev/widgets/home_calendar.dart';
import 'package:settings_ui/settings_ui.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser;

  String uid = " ";
  String email = " ";
  String password = " ";
  String firstName = " ";
  String lastName = " ";
  String schoolName = " ";
  String role = " ";

  void inputData() {
    currentUser = auth.currentUser;
  }

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
                    style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                  homeCalendar(context),
                  const SizedBox(height: 16),
                  Divider(height: 10, thickness: 1, color: Theme.of(context).disabledColor),
                  const SizedBox(height: 16),
                  Text(
                    'Lunch Calendar',
                    style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                  homeCalendar(context),
                ]
            )
        )
      )
    );
  }

}