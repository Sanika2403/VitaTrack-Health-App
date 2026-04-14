import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: androidSettings);

    await _notifications.initialize(settings);
  }

  // 🔔 SIMPLE NOTIFICATION
  static Future showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'VitaTrack',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _notifications.show(0, title, body, details);
  }

  // ⏰ SCHEDULED DAILY REMINDER (SIMPLIFIED)
  static void scheduleMealReminder() async {
    // Simulate reminder (for demo — triggers after 10 sec)
    Future.delayed(Duration(seconds: 10), () {
      showNotification(
        "Healthy Reminder 🍎",
        "Don't forget to eat a balanced meal!",
      );
    });
  }
}