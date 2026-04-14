import 'package:flutter/material.dart';
import 'app_data.dart';
import 'notification_service.dart';

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {

  Map<String, Map<String, int>> foodData = {
    "Apple": {"cal": 95, "vitamins": 14, "minerals": 2},
    "Banana": {"cal": 105, "vitamins": 16, "minerals": 5},
    "Salad": {"cal": 150, "vitamins": 30, "minerals": 15},
    "Rice": {"cal": 200, "vitamins": 5, "minerals": 4},
    "Egg": {"cal": 78, "vitamins": 6, "minerals": 6},
    "Chicken": {"cal": 165, "vitamins": 5, "minerals": 8},
    "Burger": {"cal": 500, "vitamins": 3, "minerals": 4},
    "Pizza": {"cal": 285, "vitamins": 2, "minerals": 3},
  };

  String selectedFood = "Apple";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal Tracker")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            DropdownButton<String>(
              value: selectedFood,
              isExpanded: true,
              items: foodData.keys.map((food) {
                return DropdownMenuItem(
                  value: food,
                  child: Text(food),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFood = value!;
                });
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
  setState(() {
    AppData.calories += foodData[selectedFood]!["cal"]!;
    AppData.vitamins += foodData[selectedFood]!["vitamins"]!;
    AppData.minerals += foodData[selectedFood]!["minerals"]!;
  });

},
              child: Text("Add Meal"),
            ),

            SizedBox(height: 20),

            Card(
              child: ListTile(
                title: Text("Nutrition Intake"),
                subtitle: Text(
                  "Calories: ${AppData.calories} kcal\n"
                  "Vitamins Score: ${AppData.vitamins}\n"
                  "Minerals Score: ${AppData.minerals}",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}