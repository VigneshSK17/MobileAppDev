import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app_dev/helperFunctions/appointment_json.dart';
import 'package:mobile_app_dev/widgets/auth_screens/login_text_field.dart';
import 'package:mobile_app_dev/widgets/auth_screens/rounded_button.dart';
import 'package:mobile_app_dev/widgets/planner/fab_dialog_route.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class LunchMenuScreen extends StatefulWidget {
  @override
  _LunchMenuScreenState createState() => _LunchMenuScreenState();
}

class _LunchMenuScreenState extends State<LunchMenuScreen> {

  // TODO: Add school integration
  final String schoolName = "marble_hills_hs";
  var dateString = "";
  var lunchName = TextEditingController();
  late final AppointmentJson lunchMenuAppt;

  // TODO: Add school integration here also
  final Stream<QuerySnapshot> _lunchMenuStream = FirebaseFirestore.instance.collection('lunchMenus').doc("marble_hills_hs").collection('menuItems').snapshots();

  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  Row dateSelect() {
    return Row(
        children: [
          TextButton(
            child: const Text('Select Date'),
            onPressed: () => Navigator.of(context).push(FabHeroRoute(
              builder: (context) => Padding(
                  padding: const EdgeInsets.all(64.0),
                  child: SfDateRangePicker(
                    backgroundColor: Theme.of(context).cardColor,
                    selectionColor: Theme.of(context).primaryColor,
                    todayHighlightColor: Theme.of(context).primaryColor, //
                    onSelectionChanged: (date) => setState(() => {
                      dateString = date.value.toString(),
                      print(dateString)
                    }),
                  )
              ),
            )
            ),
          ),
          const Spacer(),
          Text(dateString.split(" ")[0])
        ]
    );
  }

  Future<void> addLunchAppt(AppointmentJson appt) {
    final lunchMenu = FirebaseFirestore.instance.collection('lunchMenus').doc(schoolName).collection('menuItems');

    Map<String, dynamic> apptJson = appt.toLunchMenuJson();
    print(apptJson);

    return lunchMenu.add(apptJson)
      .then((value) => print("Lunch Menu Item Added"))
      .catchError((error) => print("Failed to add lunch menu item $error"));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot> (
      stream: _lunchMenuStream,
      builder: (BuildContext context,  AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Scaffold(
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight(context) * 0.02,
                    left: deviceWidth(context) * 0.09,
                    right: deviceWidth(context) * 0.09,
                    bottom: deviceHeight(context) * 0.06,
                  ),
                  child: Column(
                      children: [
                        // Lunch Calendar View
                        SfCalendar(
                            view: CalendarView.month,
                            // TODO: Calendar Data Source
                        ),
                        const SizedBox(height: 16),
                        const Text('Add Lunch Menu Item', style: TextStyle(fontSize: 20)),
                        dateSelect(),
                        LoginTextField(
                          labelText: 'Lunch Menu Item',
                          controller: lunchName,
                          updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)]))
                        ),
                        RoundedButton(
                          text: 'Add Item',
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).backgroundColor,
                          press: () {
                            addLunchAppt(AppointmentJson(
                              isAllDay: true,
                              startTime: DateTime.parse(dateString),
                              endTime: DateTime.parse(dateString),
                              subject: lunchName.text.trim(),
                              color: Colors.green
                            ));
                          }
                        )
                      ]
                  )
              )
          )
      );
    });
  }

}

