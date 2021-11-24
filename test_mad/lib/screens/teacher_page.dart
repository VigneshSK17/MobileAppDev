import 'package:flutter/material.dart';
import 'package:mobile_app_dev/base_scaffold.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(2, Text('Teacher Page'), Text('Teacher Page'));
  }
}
