import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app_dev/helperFunctions/appointment_data_source.dart';
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
  List<AppointmentJson> lunchList = [];
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

  getLunchMenu(AsyncSnapshot<QuerySnapshot> snapshot) {
    for(var doc in snapshot.data!.docs) {
      print(doc.toString());
      print(doc.get('color'));
      var lunchMenuItem = AppointmentJson(
          startTime: DateTime.parse(doc.get('startTime')),
          endTime: DateTime.parse(doc.get('endTime')),
          subject: doc.get('menuItem'),
          color: Color(int.parse(doc.get('color').split('(0x')[1].split(')')[0], radix: 16)),
          isAllDay: true
      );
      if(!lunchList.contains(lunchMenuItem)) lunchList.add(lunchMenuItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot> (
      stream: _lunchMenuStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        getLunchMenu(snapshot);
        return Scaffold(
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight(context) * 0.02,
                    left: deviceWidth(context) * 0.09,
                    right: deviceWidth(context) * 0.09,
                    bottom: deviceHeight(context) * 0.09,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        children: [
                          // Lunch Calendar View
                          Flexible(
                            flex: 1,
                            child: SfCalendar(
                              view: CalendarView.month,
                              monthViewSettings: MonthViewSettings(showAgenda: true),
                              // TODO: Calendar Data Source
                              dataSource: AppointmentDataSource(lunchList),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                                children: [
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
                                            color: Color(0xff4caf50)
                                        ));
                                      }
                                  )
                                ]
                            )
                          )
                        ]
                    )
                  )
              )
          )
      );
    });
  }

}

