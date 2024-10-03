import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool _isNotificationEnabled = true;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Notification Switch
          buildListTile(
            context,
            title: 'Notification',
            trailing: Switch(
              value: _isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
            icon: Icons.notifications,
          ),
          const Divider(),
          // Country
          buildListTile(
            context,
            title: 'Country',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Egypt', style: TextStyle(fontSize: 16.0)),
                const SizedBox(width: 8.0),
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Egypt.svg',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
            icon: Icons.language,
          ),
          const Divider(),
          // Language
          buildListTile(
            context,
            title: 'Language',
            trailing: const Text('English', style: TextStyle(fontSize: 16.0)),
            icon: Icons.translate,
          ),
          const Divider(),
          // Mode Switch
          buildListTile(
            context,
            title: 'Mode',
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
            icon: Icons.wb_sunny,
          ),
          const Divider(),
          // Password
          buildListTile(
            context,
            title: 'Password',
            trailing: const Icon(Icons.arrow_forward_ios),
            icon: Icons.lock,
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context,
      {String? title, Widget? trailing, IconData? icon}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title!, style: const TextStyle(fontSize: 18.0)),
      trailing: trailing,
      onTap: () {
        // Handle tile tap if needed
      },
    );
  }
}
