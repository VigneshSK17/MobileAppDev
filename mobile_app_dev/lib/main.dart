import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'bars.dart';

// Starts the app directly w/ the MyApp class
void main() => runApp(MyApp());

// Basically the root of the app, defines basic things like themeing and routes

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD App',
      theme: FlexColorScheme.light(scheme: FlexScheme.mango).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.mango).toTheme,
      initialRoute: '/BarsScreen',
      routes: {
        '/BarsScreen': (context) => BarsScreen()
      }
    );
  }

}

