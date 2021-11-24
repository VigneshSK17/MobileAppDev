import 'package:flutter/material.dart';
import 'package:mobile_app_dev/base_scaffold.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(1, Text('My Home Page'), Text('Home Page'));
  }
}
