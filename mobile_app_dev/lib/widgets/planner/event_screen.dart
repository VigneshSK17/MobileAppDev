import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app_dev/helperFunctions/planner_events.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'fab_dialog_route.dart';

class EventScreen extends StatefulWidget {
  Events userInfo;
  EventScreen(this.userInfo);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  // TODO: Gather info once button is pressed and streamline it to planner

  String eventName = "(No Title)";

  // TODO: Add validation to make sure startDate is before endDate and startTime is same or before endTime
  String startDateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String endDateString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  // TODO: Change the starting color to the theme's color
  String colorString = "Red";
  Color eventColor = Colors.red;

  String eventDescription = "";

  bool isFullDay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add an event'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onSubmitted: (name) => setState(() => eventName = name),
                style: TextStyle(fontSize: 32.0),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).canvasColor,
                  hintText: 'Name of Event'
                )
              ),
              Gap(12),
              dateSelect(true),
              dateSelect(false),
              Divider(height: 10, thickness: 1, color: Theme.of(context).disabledColor),
              timeSelect(true),
              timeSelect(false),
              Divider(height: 10, thickness: 1, color: Theme.of(context).disabledColor),
              Row(
                children: [
                  colorSelect(),
                  const Spacer(),
                  Text('All Day'),
                  fullDayCheck()
                ]
              ),
              TextField(
                // textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
                onSubmitted: (inputText) => setState(() => eventDescription = inputText),
              ),
              Gap(12),
              confirmButton()
            ],
          )
      )
      )
    );
  }

  // Date selection widget
  Row dateSelect(var isStart) {
    return Row(
        children: [
          TextButton(
            child: isStart ? const Text('Start Date') : const Text('End Date'),
            onPressed: () => Navigator.of(context).push(FabHeroRoute(
              builder: (context) => Padding(
                  padding: const EdgeInsets.all(64.0),
                  child: SfDateRangePicker(
                    backgroundColor: Theme.of(context).cardColor,
                    selectionColor: Theme.of(context).primaryColor,
                    todayHighlightColor: Theme.of(context).primaryColor, //
                    onSelectionChanged: (startDate) => setState(() => {
                      if(isStart) {
                        startDateString = startDate.value.toString(),
                        print(startDateString)
                      } else {
                        endDateString = startDate.value.toString(),
                        print(endDateString)
                      }
                    }),
                  )
              ),
            )
            ),
          ),
          const Spacer(),
          Text(isStart ? startDateString.split(" ")[0] : endDateString.split(" ")[0])
        ]
    );
  }

  // Time selection widget
  Row timeSelect(var isStart) {
    return Row(
      children: [
        TextButton(
          child: isStart ? const Text('Start Time') : const Text('End Time'),
          onPressed: () {
            _selectTime(context, isStart);
          },
        ),
        const Spacer(),
        Text("${DateFormat("h:mm a").format(join(DateTime.now(), isStart ? startTime : endTime))}")
      ]
    );
  }

  DateTime join(DateTime date, TimeOfDay time) {
    return new DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: startTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != startTime)
    {
      setState(() {
        isStart ? startTime = timeOfDay : endTime = timeOfDay;
      });
    }
  }

  // Full day slider
  Checkbox fullDayCheck() {
    return Checkbox(
        value: isFullDay,
        onChanged: (value) => setState(() => isFullDay = value!)
    );
  }

  // Color selection
  DropdownButton<String> colorSelect() {
    return DropdownButton<String>(
      value: colorString,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: TextStyle(color: Theme.of(context).primaryColor),
      underline: Container(
        height: 2,
        color: eventColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          colorString = newValue!;
          switch(colorString) {
            case "Red":
              eventColor = Colors.red;
              break;
            case "Dark Red":
              eventColor = Colors.red[900]!;
              break;
            case "Orange":
              eventColor = Colors.orange;
              break;
            case "Yellow":
              eventColor = Colors.yellow;
              break;
            case "Green":
              eventColor = Colors.green;
              break;
            case "Dark Green":
              eventColor = Colors.green[900]!;
              break;
            case "Light Blue":
              eventColor = Colors.lightBlue;
              break;
            case "Blue":
              eventColor = Colors.blue;
              break;
            case "Purple":
              eventColor = Colors.purple;
              break;
            case "Indigo":
              eventColor = Colors.indigo;
              break;
            case "Gray":
              eventColor = Colors.grey;
              break;
          }
        });
      },
      items: <String>['Red', 'Dark Red', 'Orange', 'Yellow', 'Green', 'Dark Green', 'Light Blue', 'Blue', 'Purple', 'Indigo', 'Gray']
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value)
              );
      }).toList(),
    );
  }

  // Confirm Button
  ElevatedButton confirmButton() {
    DateTime startDate;
    DateTime endDate;

    return ElevatedButton(
      child: Text('Save'),
      onPressed: () => {
        createEvent(),
        Navigator.pop(context)
      }//createEvent()
    );
  }

  // Firebase: Take the event from this and store in firebase.
  void createEvent() {
    startDateString = startDateString.split(" ")[0];
    endDateString = endDateString.split(" ")[0];

    DateTime startDate = makeDateTime(startDateString, startTime);
    DateTime endDate = makeDateTime(endDateString, endTime);

    widget.userInfo.addEvent(Event(eventName, startDate, endDate, eventColor, isFullDay));
  }

}