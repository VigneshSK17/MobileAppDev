import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'screens/ec_screen.dart';
import 'screens/home_screen.dart';
import 'screens/planner_screen.dart';
import 'screens/planner_screen2.dart';
import 'screens/settings_screen.dart';
import 'screens/teacher_screen.dart';

class BarsScreen extends StatefulWidget {
  @override
  State<BarsScreen> createState() => _BarsScreenState();
}

class _BarsScreenState extends State<BarsScreen> {
  int _selectedIndex = 3;

  // Temporary for the sake of display, add notifs later on
  List<String> items = new List<String>.generate(19, (i) => "Items ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      TeacherScreen(),
      ECScreen(),
      PlannerScreen2(),
      HomeScreen(),
    ];

    final List<String> _titles = [
      "Teacher Directory",
      "My Extracurricular Activities",
      "My Planner",
      "My Home Page",
    ];

    var _titleString = _titles[_selectedIndex];
    void selectedPage(int index) {
      setState(() {
        _selectedIndex = index;
        _titleString = _titles[index];
      });
    }

    return Scaffold(
      body: _pages[_selectedIndex],
      // body: bodyFunction(),
      appBar: AppBar(
          centerTitle: true,
          title: Text(_titleString),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: selectedPage,
      //   currentIndex: _selectedIndex,
      //   backgroundColor: Theme.of(context).backgroundColor,
      //   unselectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
      //   selectedItemColor: Theme.of(context).primaryColor,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Teachers'),
      //     BottomNavigationBarItem(icon: Icon(Icons.sports_football), label: 'Extracurriculars'),
      //     BottomNavigationBarItem(icon: Icon(Icons.calendar_today_sharp), label: 'Planner'),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //   ]
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: selectedPage,
        // color: Theme.of(context).textSelectionTheme.selectionColor,
        color: Colors.grey,
        activeColor: Theme.of(context).primaryColor,
        tabs: const <GButton>[
          GButton(icon: Icons.school, text: 'Teachers'),
          GButton(icon: Icons.sports_football, text: 'Activities'),
          GButton(icon: Icons.calendar_today_sharp, text: 'Planner'),
          GButton(icon: Icons.home, text: 'Home')
        ],
        haptic: true,
        gap: 8,
      ),
    );
  }
}
