import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'screens/home_screen.dart';
import 'screens/planner_screen.dart';
import 'screens/settings_screren.dart';
import 'screens/teacher_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD App',
      theme: FlexColorScheme.light(scheme: FlexScheme.mango).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.mango).toTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/teachers': (context) => TeacherScreen(),
        '/planner': (context) => PlannerScreen(),
        '/settings': (context) => SettingsScreen(),
      }
    );
  }
}

