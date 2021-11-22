import 'package:flutter/cupertino.dart';

import '../main.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        2, Text('Teacher Directory'), Text('The Teacher Directory'));
  }
}
