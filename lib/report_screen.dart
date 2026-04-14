import 'package:flutter/material.dart';
import 'app_data.dart';

class ReportScreen extends StatelessWidget {

  Color getScoreColor(int score) {
    if (score >= 75) return Colors.green;
    if (score >= 50) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {

    int burned = AppData.getBurnedCalories();
    int net = AppData.calories - burned;
    int score = AppData.getHealthScore();

    double calorieProgress = AppData.calories / AppData.targetCalories;
    double stepProgress = AppData.steps / AppData.targetSteps;

    return Scaffold(
      appBar: AppBar(title: Text("Health Report")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔥 HEALTH SCORE (COLORED)
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(Icons.favorite, color: getScoreColor(score), size: 35),
                title: Text("Health Score"),
                subtitle: Text(
                  "$score / 100",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: getScoreColor(score),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // 🔥 CALORIES WITH PROGRESS
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Calories",
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    SizedBox(height: 5),

                    LinearProgressIndicator(value: calorieProgress),

                    SizedBox(height: 8),

                    Text(
                      "Eaten: ${AppData.calories} kcal\n"
                      "Burned: $burned kcal\n"
                      "Net: $net kcal",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // 🔥 STEPS WITH PROGRESS
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Steps",
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    SizedBox(height: 5),

                    LinearProgressIndicator(value: stepProgress),

                    SizedBox(height: 8),

                    Text("${AppData.steps} / ${AppData.targetSteps}"),
                    SizedBox(height: 20),

                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Daily Comparison",
                                style: TextStyle(fontWeight: FontWeight.bold)),

                            SizedBox(height: 10),

                            Text(
                             "Steps: ${AppData.steps} (${AppData.compare(AppData.steps, AppData.yesterdaySteps)})"
                            ),

                            Text(
                            "Calories: ${AppData.calories} (${AppData.compare(AppData.calories, AppData.yesterdayCalories)})"
                          ),

                         Text(
                            "Score: ${AppData.getHealthScore()} (${AppData.compare(AppData.getHealthScore(), AppData.yesterdayScore)})"
                          ),

                        ],
                     ),
                    ),
                  ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // 🔥 NUTRITION
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.fastfood),
                title: Text("Nutrition"),
                subtitle: Text(
                  "Vitamins: ${AppData.vitamins}\n"
                  "Minerals: ${AppData.minerals}",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}