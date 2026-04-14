import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'login_screen.dart';
import 'main.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // 🌙 DARK MODE
            SwitchListTile(
              title: Text("Dark Mode"),
              value: globalDarkMode,
              onChanged: (value) {
                setState(() {
                  globalDarkMode = value;
                });

                if (globalToggle != null) {
                  globalToggle!(value);
                }
              },
            ),

            Divider(),

            // 👤 PROFILE
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Profile"),
                    content: Text(
                      "Name: Sanika\n"
                      "App: VitaTrack\n"
                      "Role: User",
                    ),
                  ),
                );
              },
            ),

            Divider(),

            // 📄 ABOUT US
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AboutScreen()),
                );
              },
            ),

            Divider(),

            // 🚪 LOGOUT
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                  (route) => false,
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}