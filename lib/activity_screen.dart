import 'package:flutter/material.dart';
import 'app_data.dart';
import 'notification_service.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  int targetSteps = 8000;

  @override
  Widget build(BuildContext context) {

    double progress = AppData.steps / targetSteps;

    return Scaffold(
      appBar: AppBar(title: Text("Activity Tracker")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              child: ListTile(
                title: Text("Steps"),
                subtitle: Text("${AppData.steps} / $targetSteps"),
              ),
            ),

            SizedBox(height: 10),

            LinearProgressIndicator(value: progress),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: () {
  setState(() {
    AppData.steps += 500;
  });

},
                  child: Text("+"),
                ),

                ElevatedButton(
                  onPressed: () {
  setState(() {
    if (AppData.steps >= 500) {
      AppData.steps -= 500;
    }
  });
},
                  child: Text("-"),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "Calories Burned: ${AppData.getBurnedCalories()} kcal",
            ),
          ],
        ),
      ),
    );
  }
}