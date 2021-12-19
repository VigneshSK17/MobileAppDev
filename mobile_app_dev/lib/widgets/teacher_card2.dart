import 'package:flutter/material.dart';

Card teacherCard2(var teacherImage, var teacherTitle, var teacherFirstName, var teacherLastName, var teacherDept,
    int roomNum, var teacherEmail, var teacherWebsite, var context) {
  return Card(
      elevation: 2,
      child: Column(children: <Widget>[
        ListTile(
          title: Text(teacherTitle + " " + teacherFirstName + " " + teacherLastName),
          subtitle: Text(teacherDept + " | Room #" + roomNum.toString()),
        ),
        ButtonBar(alignment: MainAxisAlignment.start, children: [
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(teacherEmail),
                duration: Duration(seconds: 1),
              ));
            },
          ),
          IconButton(
              icon: Icon(Icons.link),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(teacherWebsite),
                  duration: Duration(seconds: 1),
                ));
              })
        ])
      ]));
}
