import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app_dev/firebase/auth_provider.dart';
import 'package:mobile_app_dev/firebase_options.dart';
import 'package:mobile_app_dev/screens/admin/admin_screen.dart';
import 'package:mobile_app_dev/screens/settings_screen.dart';
import 'package:mobile_app_dev/screens/signin_screen.dart';

import 'package:provider/provider.dart';

import 'bars.dart';

// Starts the app directly w/ the MyApp class
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// Basically the root of the app, defines basic things like themeing and routes

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState, initialData: null,
        )
      ],
      child: MaterialApp(
          title: 'MAD App',
          theme: FlexColorScheme.light(scheme: FlexScheme.mango).toTheme,
          darkTheme: FlexColorScheme.dark(scheme: FlexScheme.mango).toTheme,
          locale: const Locale('us'),
          home: AdminScreen(),
          // initialRoute: SignInScreen.id,
          // routes: {
          //   BarsScreen.id: (context) => BarsScreen(),
          //   SettingsScreen.id: (context) => SettingsScreen(),
          //   SignInScreen.id: (context) => SignInScreen()
          // }
          )
    );
  }
}
