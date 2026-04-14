import 'package:flutter/material.dart';
import 'meal_screen.dart';
import 'activity_screen.dart';
import 'report_screen.dart';
import 'analysis_screen.dart';
import 'settings_screen.dart';
import 'notification_service.dart';
import 'app_data.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  void checkSmartNotification() {
  if (AppData.steps < 3000) {
    NotificationService.showNotification(
      "Reminder 🚶",
      "Try to walk a bit!",
    );
  } else if (AppData.calories > AppData.targetCalories) {
    NotificationService.showNotification(
      "Alert 🍔",
      "Reduce calorie intake!",
    );
  } else {
    NotificationService.showNotification(
      "Good Job 👍",
      "You're maintaining a healthy balance!",
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VitaTrack"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsScreen()),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [

            buildCard(context, "Meal Tracker", Icons.restaurant, MealScreen()),
            buildCard(context, "Activity", Icons.directions_walk, ActivityScreen()),
            buildCard(context, "Health Report", Icons.favorite, ReportScreen()),
            buildCard(context, "Smart Analysis", Icons.analytics, AnalysisScreen()),

          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, IconData icon, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}