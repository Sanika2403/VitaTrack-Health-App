import 'package:flutter/material.dart';
import 'intro_screen.dart';
import 'notification_service.dart';

// 🔥 GLOBAL THEME VARIABLES
bool globalDarkMode = false;
Function(bool)? globalToggle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  NotificationService.scheduleMealReminder(); 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void toggleTheme(bool value) {
    setState(() {
      globalDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    // 🔥 LINK SETTINGS TO APP
    globalToggle = toggleTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitaTrack',

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: globalDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: IntroScreen(),
    );
  }
}