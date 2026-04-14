import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About VitaTrack"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "VitaTrack is a health and lifestyle management application designed to help users monitor their daily activities and nutrition.\n\n"
          "The app tracks calorie intake, step count, and nutritional balance while providing insights such as health score and smart analysis.\n\n"
          "Goal:\nTo promote a balanced and healthy lifestyle through simple tracking and intelligent insights.\n\n"
          "Developed by: Sanika Deshmukh\n"
          "Guided by: Dr. Rupa S. Karnik\n"
          "PG Department of Computer Science",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}