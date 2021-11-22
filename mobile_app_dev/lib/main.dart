import 'package:card_swiper/card_swiper.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'constants.dart';
import 'screens/planner.dart';
import 'screens/settings.dart';
import 'screens/teachers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD App',
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch: Constants.primarySwatch,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Constants.lCBackground,
      //     foregroundColor: Colors.black,
      //     shadowColor: Constants.lCBackground,
      //     elevation: 0
      //   ),

      //   textTheme: TextTheme(
      //     bodyText1: GoogleFonts.bitter(fontSize: 14.0)
      //   )
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Constants.primarySwatch,
      //     appBarTheme: const AppBarTheme(
      //         backgroundColor: Constants.lCBackground,
      //         foregroundColor: Constants.bCForeground,
      //         shadowColor: Constants.lCBackground,
      //         elevation: 0
      //     ),

      //   textTheme: TextTheme(
      //     bodyText1: GoogleFonts.bitter(fontSize: 14.0)
      //   )
      // ),

      theme: FlexColorScheme.light(scheme: FlexScheme.red).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.red).toTheme,

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        1,
        Text('Home Page'),
        Column(
          children: <Widget>[
            Expanded(
              child: Swiper(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Center(
                      child: Text('Page $index'),
                    ),
                  );
                },
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: SwiperPagination(),
                // control: SwiperControl(),
                control: null,
                autoplay: true,
              ),
            ),
            Expanded(flex: 2, child: Text('Filllller')),
            Expanded(flex: 4, child: Text('Calendar')),
          ],
        ));
  }
}

class BaseScaffold extends StatelessWidget {
  BaseScaffold(this.selectedIndex, this.titleString, this.bodyWidget);

  int selectedIndex;
  Text titleString;
  Widget bodyWidget;

  List<String> items = new List<String>.generate(19, (i) => "Items ${i + 1}");

  @override
  Widget build(BuildContext context) {
    Color cBackground = Theme.of(context).backgroundColor;
    // Color cPrimary = Theme.of(context).primaryColor;

    return Scaffold(
      body: bodyWidget,
      appBar: AppBar(
          centerTitle: true,
          title: titleString,
          actions: [
            IconButton(
                icon: Icon(Icons.notifications_sharp),
                tooltip: 'Unread Notifications: x',
                onPressed: () {
                  HapticFeedback.lightImpact;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                            shape: RoundedRectangleBorder(),
                            elevation: 16,
                            child: Container(
                                child: ListView.builder(
                                    itemCount: items.length,
                                    itemBuilder: (context, int index) {
                                      return Dismissible(
                                          key: Key(items[index]),
                                          onDismissed: (direction) {
                                            items.removeAt(index);
                                          },
                                          child: ListTile(
                                              title: Text('${items[index]}'),
                                              subtitle: Text(
                                                  '${items[index]} Info')));
                                    })));
                      });
                }),
          ],
          leading: IconButton(
              icon: Icon(Icons.account_circle_sharp),
              tooltip: 'Account and App Settings',
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              })),
      bottomNavigationBar: PlatformNavBar(
          currentIndex: selectedIndex,
          itemChanged: (index) {
            selectedIndex = index;
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        PlannerPage(),
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
              case 1:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        MyHomePage(),
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
              case 2:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        TeacherPage(),
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today_sharp), label: 'Planner'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Teachers'),
          ]),
      // bottomNavigationBar: GNav(
      //   selectedIndex: selectedIndex,
      //   haptic: true,
      //   gap: 16,
      //   duration: Duration(milliseconds: 0),

      //   color: cBackground,
      //   tabs: const [
      //     GButton(
      //       iconColor: Colors.grey,
      //       icon: Icons.calendar_today_sharp,
      //       text: 'Lunch'
      //     ),
      //     GButton(
      //       iconColor: Colors.grey,
      //       icon: Icons.school,
      //       text: 'Home Page',
      //     ),
      //     GButton(
      //       iconColor: Colors.grey,
      //       icon: Icons.class__sharp,
      //       text: 'Directory'
      //     )
      //   ],
      // ),
    );
  }
}
