import 'package:flutter/material.dart';
import 'app_data.dart';

class AnalysisScreen extends StatelessWidget {

  // 🔥 BALANCE INDEX
  String getBalanceIndex() {
    double stepScore = (AppData.steps / AppData.targetSteps) * 50;
    double calorieScore =
        ((AppData.calories - AppData.getBurnedCalories()) <= AppData.targetCalories)
            ? 50
            : 20;

    int total = (stepScore + calorieScore).toInt();

    if (total > 100) total = 100;
    if (total < 0) total = 0;

    return "$total%";
  }

  // 🔥 SMART MESSAGE
  String getMessage() {
    if (AppData.steps < 3000) {
      return "You need to be more active today 🚶";
    }

    if ((AppData.calories - AppData.getBurnedCalories()) > AppData.targetCalories) {
      return "Your calorie intake is too high ⚠️";
    }

    if (AppData.steps > 7000 &&
        (AppData.calories - AppData.getBurnedCalories()) <= AppData.targetCalories) {
      return "Excellent lifestyle today! 🔥";
    }

    return "You're doing good, keep improving 👍";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smart Analysis")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            buildCard("Balance Index", getBalanceIndex()),
            buildCard("Day Type", AppData.getDayType()),
            buildCard("Energy Level", AppData.getEnergyLevel()),
            buildCard("Deviation", AppData.getDeviation()),

            SizedBox(height: 20),

            // 🔥 MESSAGE CARD
            Card(
              elevation: 5,
              color: Colors.blue.shade50,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  getMessage(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String value) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        trailing: Text(value),
      ),
    );
  }
}