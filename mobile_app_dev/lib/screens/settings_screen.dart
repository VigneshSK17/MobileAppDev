import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

// TODO: Flush out and create proper settings

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('My Settings')),
        body: SafeArea(
            child: SettingsList(
          sections: [
            SettingsSection(
              titlePadding: EdgeInsets.all(20),
              title: 'Account Settings',
              tiles: [
                SettingsTile(
                    title: 'Account',
                    subtitle: 'Manage your account',
                    leading: Icon(Icons.person),
                    onPressed: (context) => {}),
                SettingsTile(
                    title: 'Notifications',
                    subtitle: 'Manage your notifications',
                    leading: Icon(Icons.notifications),
                    onPressed: (context) => {}),
                SettingsTile(
                    title: 'Privacy',
                    subtitle: 'Manage your privacy',
                    leading: Icon(Icons.lock),
                    onPressed: (context) => {}),
              ],
            ),
            SettingsSection(
              titlePadding: EdgeInsets.all(20),
              title: 'Preferences',
              tiles: [
                SettingsTile(
                  title: 'Lunch Alerts',
                  leading: Icon(Icons.brightness_2),
                ),
                SettingsTile(
                  title: 'Calendar Alerts',
                  leading: Icon(Icons.brightness_2),
                ),
              ],
            )
          ],
        )));
  }
}
