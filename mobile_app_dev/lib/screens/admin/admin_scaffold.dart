import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app_dev/screens/admin/add_events_widget.dart';
import 'package:mobile_app_dev/screens/admin/add_student_screen.dart';
import 'package:mobile_app_dev/screens/admin/add_teacher_screen.dart';
import 'package:mobile_app_dev/screens/admin/school_events_screen.dart';
import 'package:mobile_app_dev/screens/admin/student_search_screen.dart';
import 'package:mobile_app_dev/screens/admin/teacher_search_screen.dart';
import 'package:mobile_app_dev/screens/ec_screen.dart';

import 'admin_screen.dart';

class AdminScaffold extends StatefulWidget {
  static String id = '/Admin';

  @override
  State<AdminScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      AdminScreen(),
      CreateStudentScreen(),
      StudentSearchScreen(),
      AddEventsWidget(context),
      AdminScreen(),
      AdminScreen(),
      AdminScreen(),
      AdminScreen(),
      CreateTeacherScreen(),
      TeacherSearchScreen(),
    ];

    final List<String> _titles = [
      "Dashboard",
      "Add Students",
      "Student Search",
      "Add Events",
      "Edit Events",
      "Delete Events",
      "Lunch Menu",
      "Extracurriculars",
      "Add Teachers",
      "Teacher Search",
      // "My Planner",
      // "My Home Page",
    ];

    var _titleString = _titles[_selectedIndex];
    void selectedPage(int index) {
      setState(() {
        _selectedIndex = index;
        _titleString = _titles[index];
      });
    }

    // TODO: Implement screens
    // TODO: Make teacher and student search have delete operations
    return Scaffold(
      body: _pages[_selectedIndex],
      // body: bodyFunction(),
      appBar: AppBar(
          centerTitle: true,
          title: Text(_titleString),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Align(alignment: Alignment.bottomLeft, child: Text('Settings Pages'))
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () =>
              {
                setState(() {
                  _selectedIndex = 0;
                  _titleString = _titles[0];
                }),
                Navigator.pop(context)
              },
            ),
            ExpansionTile(
              title: const Text('Students'),
              children: [
                ListTile(
                  title: const Text('Add Students'),
                  onTap: () =>
                  {
                    setState(() {
                      _selectedIndex = 1;
                      _titleString = _titles[1];
                    }),
                    Navigator.pop(context)
                  },
                ),
                ListTile(
                  title: const Text('Student Search'),
                  onTap: () =>
                  {
                    setState(() {
                      _selectedIndex = 2;
                      _titleString = _titles[2];
                    }),
                    Navigator.pop(context)
                  },
                )
              ],
            ),
            ExpansionTile(
              title: const Text('School Events'),
              children: [
                ListTile(
                  title: const Text('Add Events'),
                  onTap: () =>
                  {
                    setState(() {
                      _selectedIndex = 3;
                      _titleString = _titles[3];
                    }),
                    Navigator.pop(context)
                  },
                ),
                ListTile(
                  title: const Text('Edit Events'),
                  onTap: () =>
                  {
                    setState(() {
                      _selectedIndex = 4;
                      _titleString = _titles[4];
                    }),
                    Navigator.pop(context)
                  },
                ),
                ListTile(
                  title: const Text('Delete Events'),
                  onTap: () =>
                  {
                    setState(() {
                      _selectedIndex = 5;
                      _titleString = _titles[5];
                    }),
                    Navigator.pop(context)
                  },
                )
              ],
            ),
            ListTile(
              title: const Text('Lunch Menu'),
              onTap: () =>
              {
                setState(() {
                  _selectedIndex = 6;
                  _titleString = _titles[6];
                }),
                Navigator.pop(context)
              },
            ),
            ListTile(
              title: const Text('Extracurriculars'),
              onTap: () =>
              {
                setState(() {
                  _selectedIndex = 7;
                  _titleString = _titles[7];
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ECScreen()));
                }),
                // Navigator.pop(context)
              },
            ),
            ExpansionTile(
              title: Text('Teachers'),
              children: [
                ListTile(
                  title: const Text('Add Teachers'),
                  onTap: () =>
                  {
                    setState(() {
                      _selectedIndex = 8;
                      _titleString = _titles[8];
                    }),
                    Navigator.pop(context)
                  },
                ),
                ListTile(
                  title: const Text('Teacher Search'),
                  onTap: () =>
                  {
                    setState(() {
                      _selectedIndex = 9;
                      _titleString = _titles[9];
                    }),
                    Navigator.pop(context)
                  },
                ),
              ],
            )
          ]),
      ),
    );
  }
}
