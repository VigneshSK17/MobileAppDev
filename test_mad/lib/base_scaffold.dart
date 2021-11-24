import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'screens/home_screen.dart';
import 'screens/planner_screen.dart';
import 'screens/settings_screren.dart';
import 'screens/teacher_page.dart';

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
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
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
                        PlannerScreen(),
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
                        TeacherScreen(),
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
    );
  }
}
