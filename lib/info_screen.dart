import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade300, Colors.blue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Image
            Image.asset(
              "assets/diet.jpg",
              height: 200,
            ),

            SizedBox(height: 30),

            Text(
              "Track your life.\nImprove your future.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Monitor calories, track steps, capture meals, and build a healthier lifestyle using smart insights.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                padding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                 MaterialPageRoute(builder: (_) => SignupScreen()),
              );
          },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}