class AppData {
  static int calories = 0;
  static int vitamins = 0;
  static int minerals = 0;
  static int steps = 4000;

  static int targetCalories = 2000;
  static int targetSteps = 8000;

  // 🔥 YESTERDAY DATA
  static int yesterdaySteps = 3500;
  static int yesterdayCalories = 1500;
  static int yesterdayScore = 60;

  // 🔥 CALCULATIONS
  static int getBurnedCalories() {
    return (steps * 0.04).toInt();
  }

  static int getHealthScore() {
    int net = calories - getBurnedCalories();

    double stepScore = (steps / targetSteps) * 50;
    double calorieScore = (net <= targetCalories) ? 50 : 20;

    int total = (stepScore + calorieScore).toInt();

    if (total > 100) total = 100;
    if (total < 0) total = 0;

    return total;
  }

  // 🔥 DAY TYPE
  static String getDayType() {
    int net = calories - getBurnedCalories();

    if (net > targetCalories) return "Overloaded ⚠️";
    if (steps >= targetSteps) return "Healthy Day 💪";
    if (steps >= targetSteps * 0.6) return "Balanced Day 👍";

    return "Inactive Day 🚨";
  }

  // 🔥 ENERGY LEVEL
  static String getEnergyLevel() {
    if (steps > 7000) return "High ⚡";
    if (steps > 4000) return "Medium ⚡";
    return "Low ⚡";
  }

  // 🔥 DEVIATION
  static String getDeviation() {
    int calorieDiff = calories - targetCalories;
    int stepDiff = steps - targetSteps;

    return "${calorieDiff} kcal | ${stepDiff} steps";
  }

  // 🔥 COMPARISON
  static String compare(int today, int yesterday) {
    if (today > yesterday) return "↑ +${today - yesterday}";
    if (today < yesterday) return "↓ -${yesterday - today}";
    return "→ same";
  }
}